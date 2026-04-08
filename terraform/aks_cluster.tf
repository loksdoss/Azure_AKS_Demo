resource "azurerm_kubernetes_cluster" "aks" {

  name                = "aks-${local.project_name}-${local.environment}"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aks${local.environment}"

 default_node_pool {

  name       = "system"
  node_count = 1
  vm_size    = "Standard_DC2s_v3"

  vnet_subnet_id = azurerm_subnet.aks_subnet.id

  upgrade_settings {
    max_surge = "1"
  }

}

  identity {
    type = "SystemAssigned"
  }

  network_profile {

  network_plugin    = "azure"
  load_balancer_sku = "standard"

  service_cidr   = "10.2.0.0/16"
  dns_service_ip = "10.2.0.10"

}

  oms_agent {

    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_logs.id

  }

  tags = local.common_tags

}