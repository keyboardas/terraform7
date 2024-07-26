module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  region   = var.region
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id = module.vpc.vpc_id
  subnets = var.subnets
  subnet_names = var.subnet_names
  region  = var.region
}

module "internet_gateway" {
  source         = "./modules/internet-gateway"
  vpc_id         = module.vpc.vpc_id
  route_table_id = module.vpc.route_table_id
  public_subnets = [element(module.subnets.subnet_ids, 0), element(module.subnets.subnet_ids, 1)]
  private_subnets = [element(module.subnets.subnet_ids, 2)]
}

module "ec2_public" {
  source = "./modules/ec2_public"

  ami_id          = var.ami_id
  instance_type   = var.instance_type
  vpc_id          = module.vpc.vpc_id
  public_subnet_id = element(module.subnets.subnet_ids, 0)
  key_name        = var.key_name
  ssh_allowed_ip  = var.ssh_allowed_ip
}

module "ec2_private" {
  source = "./modules/ec2_private"

  ami_id           = var.ami_id
  instance_type    = var.instance_type
  vpc_id           = module.vpc.vpc_id
  private_subnet_id = element(module.subnets.subnet_ids, 2)
  public_subnet_cidr = var.subnets[0]
  key_name        = var.key_name
}

module "secrets" {
  source     = "./modules/secrets"
  secret_arn = var.secrets_arn
}

module "rds" {
  source              = "./modules/rds"

  allocated_storage   = var.db_allocated_storage
  engine              = var.db_engine
  engine_version      = var.db_engine_version
  instance_class      = var.db_instance_class
  db_name             = "realworld"
  username            = module.secrets.username
  password            = module.secrets.password
  parameter_group_name = var.db_parameter_group_name
  the_db_subnet_ids     = [element(module.subnets.subnet_ids, 3), element(module.subnets.subnet_ids, 4)]
  vpc_id              = module.vpc.vpc_id
  allowed_cidr        = var.db_allows_from_cidr
}

module "alb" {
  source = "./modules/alb"

  vpc_id          = module.vpc.vpc_id
  public_subnets  = [element(module.subnets.subnet_ids, 0), element(module.subnets.subnet_ids, 1)]
  ec2_instance_id = module.ec2_public.instance_id
}