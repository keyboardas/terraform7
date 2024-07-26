output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "db_instance_endpoint" {
  value = module.rds.db_instance_endpoint
}

output "db_instance_id" {
  value = module.rds.db_instance_id
}

output "db_instance_local_ip" {
  value = module.rds.local_ip
}

output "public_ec2_local_ip" {
  value = module.ec2_public.local_ip
}

output "private_ec2_local_ip" {
  value = module.ec2_private.local_ip
}

output "private_ec2_instance_id" {
  value = module.ec2_private.instance_id
}

output "public_ec2_instance_id" {
  value = module.ec2_public.instance_id
}

output "public_ec2_public_ip" {
  value = module.ec2_public.public_ip
}

output "private_ec2_public_ip" {
  value = module.ec2_private.public_ip
}

output "subnets" {
  value = {
    for index, id in module.subnets.subnet_ids : var.subnet_names[index] => {
      id   = id
      cidr = var.subnets[index]
    }
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_region" {
  value = var.region
}

output "db_subnet_id" {
  value = module.subnets.db_subnet_id
}