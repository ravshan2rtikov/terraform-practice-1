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
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Main VPC"
  }
}

resource "aws_vpc" "second" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "Second VPC"
  }
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1" 
}
