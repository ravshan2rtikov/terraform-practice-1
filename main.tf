terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "Main VPC"
  }
}

resource "aws_subnet" "web" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.az1
  tags = {
    "Name" = "Web Subnet"
  }
}

resource "aws_internet_gateway" "my_web_igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "Main VPC IGW"
  }
}

resource "aws_default_route_table" "main_vpc_default_rt" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_web_igw.id
  }
  tags = {
    "Name" = "My Default Route Table"
  }
}

resource "aws_default_security_group" "default_sec_group" {
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
  }

  tags = {
    "Name" = "Default Security Group"
  }
}