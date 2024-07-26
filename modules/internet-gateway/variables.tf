variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "route_table_id" {
  description = "The ID of the route table"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnet IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of public subnet IDs"
  type        = list(string)
}
