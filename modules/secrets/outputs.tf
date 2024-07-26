output "username" {
  value     = local.secret_map["username"]
  sensitive = true
}

output "password" {
  value     = local.secret_map["password"]
  sensitive = true
}