variable "region" {
  description = "The AWS region to deploy the infrastructure"
  default     = "us-east-2"
}

variable "account_id" {
  description = "The AWS account ID"
  default     = "767397990869"
}

variable "ami" {
  description = "The AMI to use for the EC2 instance"
  default     = "ami-0387a0aa73c3fd5de"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  default     = "webkp"
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks allowed to connect via SSH"
  default     = ["115.98.24.238/32"]
}
