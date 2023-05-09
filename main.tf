terraform {
  required_providers {
    helm = {
      version = "3.11.3"
    }
    aws = {
      source = "hashicorp/aws"
      version = "4.66.1"
    }
  }
}

provider "aws" {
  region = var.region
}
provider "helm" {}

resource "aws_instance" "dev-server" {
 ami = var.os_image
 key_name = var.key 
 instance_type  = var.instance-type
 associate_public_ip_address = true
subnet_id = aws_subnet.dev_subnet.id

}

resource "aws_vpc" "dev-vpc" {
  cidr_block = var.vpc-cidr
}

resource "aws_subnet" "dev_subnet" {
  vpc_id     = aws_vpc.dev.vpc.id 
  cidr_block = var.subnet1-cidr
  availability_zone = var.subnet_az

  tags = {
    Name = "dev_subnet"
  }
}


