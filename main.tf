terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "$AWS_DEFAULT_REGION"
  access_key = "$AWS_ACCESS_KEY"
  secret_key = "$AWS_SECRET_KEY"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
      "Name" = "Main VPC"
    }
  }
