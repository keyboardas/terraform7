variable "ami_id" {
  description = "The AMI ID"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The name of the key pair"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
}