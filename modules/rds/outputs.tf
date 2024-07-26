output "db_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.default.endpoint
}

output "db_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.default.id
}

output "local_ip" {
    description = "The local IP address"
    value       = aws_db_instance.default.address
}