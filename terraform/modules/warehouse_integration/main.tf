variable "name_prefix" {
  type = string
}

variable "key_vault_id" {
  type = string
}

resource "azurerm_key_vault_secret" "snowflake_account" {
  name         = "${var.name_prefix}-snowflake-account"
  value        = "replace-me"
  key_vault_id = var.key_vault_id
}
