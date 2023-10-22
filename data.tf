data "vault_generic_secret" "vault_db_secret" {
  path = "secret/db-secret"
}

data "vault_generic_secret" "vault_aws_secret" {
  path = "secret/aws-secret"
}