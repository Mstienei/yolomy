terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "yolomy" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
}
resource "aws_security_group" "instance" {
  name = "yolomy-instance"
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

  egress { #Outbound all allow
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}