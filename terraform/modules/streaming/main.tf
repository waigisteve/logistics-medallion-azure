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

resource "azurerm_eventhub_namespace" "platform" {
  name                = "${var.name_prefix}-ehns"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  capacity            = 2
  tags                = var.tags
}

resource "azurerm_eventhub" "events" {
  name                = "${var.name_prefix}-events"
  namespace_name      = azurerm_eventhub_namespace.platform.name
  resource_group_name = var.resource_group_name
  partition_count     = 8
  message_retention   = 1
}
