resource "azurerm_container_registry" "acr" {

  name                = local.acr_name
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location

  sku           = "Standard"
  admin_enabled = true

  tags = local.common_tags
}