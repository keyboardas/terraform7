############################################
################  GENERAL  #################
############################################
variable "region" {
  description = "The AWS region"
  type        = string
  default     = "eu-central-1"
}

############################################
#############  VPC & subnets  ##############
############################################
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_names" {
  description = "A list of names for the subnets"
  type        = list(string)
  default     = ["public-a", "public-b", "private", "db-a", "db-b"]
}

variable "subnets" {
  description = "A list of subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

############################################
##################  EC2s  ##################
############################################
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0e872aee57663ae2d"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
  default     = "key01"
}

variable "ssh_allowed_ip" {
  description = "The IP address to allow SSH access from"
  type        = string
}

############################################
##################  RDS  ###################
############################################
variable "db_name" {
    description = "The name of the database"
    type        = string
    default     = "realworld"
}

variable "db_allows_from_cidr" {
    description = "The CIDR block to allow access to the database from"
    type        = string
    default     = "10.0.3.0/24"
}

variable db_parameter_group_name {
  description = "The name of the DB parameter group to associate"
  type        = string
  default     = "default.mysql8.0"
}

variable "db_allocated_storage" {
    description = "The allocated storage for the RDS instance"
    type        = number
    default     = 10
}

variable "db_engine" {
    description = "The database engine to use"
    type        = string
    default     = "mysql"
}

variable "db_engine_version" {
    description = "The database engine version"
    type        = string
    default     = "8.0"
}

variable "db_instance_class" {
    description = "The instance class for the RDS instance"
    type        = string
    default     = "db.t3.micro"
}

############################################
################  SECRETS  #################
############################################
variable secrets_arn {
  description = "The ARN of the AWS Secrets Manager secret"
  type        = string
}