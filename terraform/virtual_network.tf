resource "azurerm_virtual_network" "vnet" {

  name                = "vnet-${local.project_name}-${local.environment}"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name

  address_space = ["10.0.0.0/16"]

  tags = local.common_tags
}