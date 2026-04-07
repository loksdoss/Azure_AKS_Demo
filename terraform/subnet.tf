

resource "azurerm_subnet" "aks_subnet" {

  name                 = "snet-aks-${local.environment}"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = ["10.0.1.0/24"]

}