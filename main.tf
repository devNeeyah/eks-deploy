terraform {
  required_providers {
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
vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]
}

resource "aws_vpc" "dev-vpc" {
  cidr_block = var.vpc-cidr
}

resource "aws_subnet" "dev_subnet" {
  vpc_id     = aws_vpc.dev-vpc.id 
  cidr_block = var.subnet1-cidr
  availability_zone = var.subnet_az

  tags = {
    Name = "dev_subnet"
  }
  
}
resource "aws_security_group" "dev-vpc-sg" {
  name        = "dev-vpc-sg"
 
  vpc_id      = aws_vpc.dev-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "dev-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }
  tags = {
    Name = "dev-rt"
  }
}

resource "aws_route_table_association" "dev-rt_association" {
  subnet_id      = aws_subnet.dev_subnet.id 

  route_table_id = aws_route_table.dev-rt.id
}


