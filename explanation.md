## IP 3 Configuration Management 
Configuration management using Ansible and Vagrant

## Instructions
The docker-compose file  creates three containers

1. Clone this repository
1. Change directory to the root directory of the main project
1. Run vagrant up

_A vagrant virtual machine with ubuntu image will be set up. All the prerequisites will be installed by the prerequisites ansible role. The containerization role will clone a repository I worked on the previous module modules and launch the containers_

## Launch App
1. Open your browser to launch the application http://192.168.47.7:3000/


## Stage 2: Ansible and Terraform instrumentation

This application is set up on an aws ec2 instance. Ensure you are on free tier to avoid billling charges.

## Instructions
1. Set up to your aws account on cli. Run *aws configure*
1. Download your access keys and secret keys for your account.
1. Update permissions on your key pair files to 600 *chmod 600 /path/to/keypair.pem*
1. Change directory to Stage_two  
1. Run *terraform init* to initialize terraform
1. Run *terraform apply* to set up your infrastructure
1. Follow the directives and enter the variables as prompted ie the keys and location

_An aws ec2 instance with ubuntu image will be set up. All the prerequisites will be installed by the prerequisites ansible role. The containerization role will clone a repository I worked on the previous module modules and launch the containers_  

## Launch app
1. Open your browser to launch the application *yolomy_ip:3000/* 