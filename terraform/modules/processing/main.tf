variable "name_prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

resource "azurerm_stream_analytics_job" "platform" {
  name                                     = "${var.name_prefix}-asa"
  location                                 = var.location
  resource_group_name                      = var.resource_group_name
  compatibility_level                      = "1.2"
  data_locale                              = "en-US"
  events_late_arrival_max_delay_in_seconds = 300
  events_out_of_order_max_delay_in_seconds = 120
  output_error_policy                      = "Drop"
  streaming_units                          = 3
}

resource "terraform_data" "databricks_option" {
  input = {
    alternate_runtime = "azure_databricks_job_clusters"
  }
}
