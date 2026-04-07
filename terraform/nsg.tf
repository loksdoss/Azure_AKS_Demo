resource "azurerm_network_security_group" "aks_nsg" {

  name                = "nsg-aks-${local.environment}"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {

    name                       = "Allow-HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

  tags = local.common_tags
}

// nsg assosiation with subnet

resource "azurerm_subnet_network_security_group_association" "aks_assoc" {

  subnet_id                 = azurerm_subnet.aks_subnet.id
  network_security_group_id = azurerm_network_security_group.aks_nsg.id
}