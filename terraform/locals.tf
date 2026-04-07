locals {

  environment = terraform.workspace

  project_name = "azure-aks-demo"

  location = "East US"

  resource_group_name = "rg-${local.project_name}-${local.environment}"

  common_tags = {
    project     = local.project_name
    environment = local.environment
    managed_by  = "terraform"
  }

}