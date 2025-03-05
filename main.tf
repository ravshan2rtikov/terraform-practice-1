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

resource "aws_instance" "server" {
  ami = "ami-0b03299ddb99998e9"
  instance_type = "t2.micro"
  tags = {
    Name = "Main VPC"
  }
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1" 
}
