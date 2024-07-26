output "instance_id" {
  value = aws_instance.public.id
}

output "public_ip" {
  value = aws_instance.public.public_ip
}

output "local_ip" {
  value = aws_instance.public.private_ip
}