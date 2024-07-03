variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks allowed to connect via SSH"
  default     = ["115.98.200.249/32"]
}
