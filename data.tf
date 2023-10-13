
data "vault_generic_secret" "vault_db_secret" {
  path = "secret/db-secret"
}

# output "vault_db_username_secret" {
#     #value = data.vault_generic_secret.vault_db_username.data_json
#     value = data.vault_generic_secret.vault_db_secret.data["db_username"]
#     sensitive = true
# }