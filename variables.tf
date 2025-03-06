
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "az1" {
  description = "Availability zone 1"
  type        = string
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR block"
  type        = string
}