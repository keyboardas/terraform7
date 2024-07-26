output "instance_id" {
  value = aws_instance.private.id
  description = "The ID of the private EC2 instance"
}

output "security_group_id" {
  value = aws_security_group.private_ec2_sg.id
  description = "The ID of the security group attached to the private EC2 instance"
}

output "public_ip" {
  value = aws_instance.private.public_ip
}

output "local_ip" {
  value = aws_instance.private.private_ip
}