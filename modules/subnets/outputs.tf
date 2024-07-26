output "subnet_ids" {
  value = aws_subnet.main[*].id
}

output "db_subnet_id" {
  value = aws_subnet.main[3].id
}