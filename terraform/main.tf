resource "azurerm_resource_group" "platform" {
  name     = "${local.name_prefix}-rg"
  location = var.location
  tags     = local.tags
}

module "security" {
  source              = "./modules/security"
  name_prefix         = local.name_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.platform.name
  tags                = local.tags
}

module "streaming" {
  source              = "./modules/streaming"
  name_prefix         = local.name_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.platform.name
  tags                = local.tags
}

module "data_lake" {
  source              = "./modules/data_lake"
  name_prefix         = local.name_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.platform.name
  tags                = local.tags
}

module "processing" {
  source              = "./modules/processing"
  name_prefix         = local.name_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.platform.name
}

module "warehouse_integration" {
  source              = "./modules/warehouse_integration"
  name_prefix         = local.name_prefix
  key_vault_id        = module.security.key_vault_id
}

module "observability" {
  source              = "./modules/observability"
  name_prefix         = local.name_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.platform.name
  tags                = local.tags
}
