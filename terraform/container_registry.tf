resource "azurerm_container_registry" "acr" {

  name                = "acr${replace(local.project_name, "-", "")}${local.environment}"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name

  sku           = "Standard"
  admin_enabled = true

  tags = local.common_tags
}