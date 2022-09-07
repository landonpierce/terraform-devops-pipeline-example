variable "resource_group_name" {
  type = string
  description = "The name of the resource group to create."
}

variable "resource_group_location" {
    type = string
    description = "The location that the resource group will be created in."
}

variable "app_service_plan_name" {
    type = string
    description = "The name of the app service plan to create."
}

variable "app_service_name" {
    type = string
    description = "The name of the app service to create."
}

data "azurerm_client_config" "current" {}