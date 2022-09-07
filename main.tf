### Resource Group ###

resource "azurerm_resource_group" "app_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

### App Service Plan ###

resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name 
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  os_type             = "Linux"
  sku_name            = "B3"
}

### App Service ###

resource "azurerm_linux_web_app" "app_service" {
  name                = var.app_service_name
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  service_plan_id = azurerm_service_plan.app_service_plan.id

  site_config {
    
  }
}


# ### Key Vault ###

# resource "azurerm_key_vault" "example" {
#   name                        = "lptestkeyvault02"
#   location                    = azurerm_resource_group.app_rg.location
#   resource_group_name         = azurerm_resource_group.app_rg.name
#   tenant_id                   = data.azurerm_client_config.current.tenant_id

#   sku_name = "standard"

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "Get","List","Update","Create",
#     ]

#     secret_permissions = [
#       "Get","List","Set",
#     ]

#     certificate_permissions = [
#       "Get","List","Update","Create",
#     ]
#   }
# }

# resource "azurerm_key_vault_secret" "examplesecret" {
#     name         = "lptestsecret01"
#     value        = "lptestsecretvalue01"
#     key_vault_id = azurerm_key_vault.example.id
# }
