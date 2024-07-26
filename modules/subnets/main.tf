resource "aws_subnet" "main" {
  count = length(var.subnets)

  vpc_id            = var.vpc_id
  cidr_block        = var.subnets[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = element(var.subnet_names, count.index)
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
