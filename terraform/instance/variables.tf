variable "ami" {
  description = "The AMI to use for the EC2 instance"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  default     = "webkp"
}

variable "vpc_id" {
  description = "The VPC ID"
}

variable "subnet_a_id" {
  description = "The Subnet A ID"
}

variable "security_group_id" {
  description = "The Security Group ID"
}

variable "region" {
  description = "The AWS region to deploy the infrastructure"
  default     = "us-east-2"
}

variable "account_id" {
  description = "The AWS account ID"
  default     = "767397990869"
}

variable "ecr_repository_url" {
  description = "The URL of the ECR repository"
}
