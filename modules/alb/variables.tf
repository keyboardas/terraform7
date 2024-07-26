variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnets"
  type        = list(string)
}

variable "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  type        = string
}