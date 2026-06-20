variable "name_prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

resource "azurerm_user_assigned_identity" "platform" {
  name                = "${var.name_prefix}-mi"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_key_vault" "platform" {
  name                       = replace("${var.name_prefix}kv", "-", "")
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = azurerm_user_assigned_identity.platform.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = true
  soft_delete_retention_days = 7
  tags                       = var.tags
}

output "key_vault_id" {
  value = azurerm_key_vault.platform.id
}
