provider "aws" {
  region  = "us-west-2"
  shared_credentials_file = "~/.aws/credentials"
  access_key  = var.ssh_access_key
}
resource "aws_security_group" "yolomy" {
  name = "yolomy_app"
  ingress { #frontend Port
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress { #backend Port
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress { #mongo Port
    from_port   = 27018
    to_port     = 27018
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress { #ssh Port
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress { #Outbound all allow
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "yolomyapp" {
  ami           = "ami-01ec00b4d67556905"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name                    = var.ssh_private_key
  security_groups             = [aws_security_group.yolomy.name]
   
  provisioner "remote-exec" {
  inline = ["echo 'Wait until SSH is ready'"]

  connection {
          type        = "ssh"
          user        = "ubuntu"
          private_key = file(var.private_key_path)
          host        = aws_instance.yolomyapp.public_ip
          timeout = "2m"
          agent = false
         }
     }
  provisioner "local-exec" {
  command = "ansible-playbook  -i ${aws_instance.yolomyapp.public_ip}, --private-key ${var.private_key_path} playbook.yaml"
        }
  tags={
    Name= "Yolomy App"
  }
}

output "yolomy_ip" {
  value = aws_instance.yolomyapp.public_ip
}