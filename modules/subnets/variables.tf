variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnets" {
  description = "A list of subnet CIDR blocks"
  type        = list(string)
}

variable "subnet_names" {
  description = "A list of names for the subnets"
  type        = list(string)
}

variable "region" {
  description = "The AWS region"
  type        = string
}
