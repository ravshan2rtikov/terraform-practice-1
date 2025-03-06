
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "az1" {
  description = "Availability zone 1"
  type = string
  default = "ap-southeast-1a"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type = string
  default = "10.0.0.0/16"
}

variable "web_subnet" {
  description = "Subnet CIDR block"
  type = string
  default = "10.0.10.0/24"
}