resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "realworld-vpc"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-route-table"
  }
}
