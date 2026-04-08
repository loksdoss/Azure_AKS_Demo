resource "azurerm_log_analytics_workspace" "aks_logs" {

  name                = "log-${local.project_name}-${local.environment}"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"

  retention_in_days = 30

  tags = local.common_tags

}