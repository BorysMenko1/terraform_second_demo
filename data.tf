data "vault_generic_secret" "vault_db_secret" {
  path = "secret/db-secret"
}