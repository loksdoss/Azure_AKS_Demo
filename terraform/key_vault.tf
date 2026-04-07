resource "azurerm_key_vault" "kv" {

  name                = local.key_vault_name
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name

  tenant_id = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  tags = local.common_tags
}