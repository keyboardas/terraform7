data "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = var.secret_arn
}

locals {
  secret_string = data.aws_secretsmanager_secret_version.db_credentials.secret_string

  secret_kv_pairs = split(",", trimspace(trim(local.secret_string, "{}")))

  secret_map = { for pair in local.secret_kv_pairs :
    trimspace(split(":", pair)[0]) => trimspace(split(":", pair)[1])
  }
}