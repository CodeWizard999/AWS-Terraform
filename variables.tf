variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR block"
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t2.micro"
}
