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

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
}

variable "ssh_allowed_ip" {
  description = "The IP address to allow SSH access from"
  type        = string
}