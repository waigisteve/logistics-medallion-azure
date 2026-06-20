module "platform" {
  source = "../../"

  environment     = "test"
  subscription_id = var.subscription_id
  location        = var.location
  project_name    = var.project_name
}

variable "project_name" {
  type    = string
  default = "logistics-medallion"
}

variable "subscription_id" {
  type = string
}

variable "location" {
  type = string
}
