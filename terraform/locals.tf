locals {

  environment = terraform.workspace

  project_name = "azureaksdemo"

  location = "eastus"

  resource_group_name = "rg-${local.project_name}-${local.environment}"

  acr_name = "acr${local.project_name}${local.environment}"

  key_vault_name = "kv-${local.project_name}-${local.environment}"

  common_tags = {
    project     = local.project_name
    environment = local.environment
    managed_by  = "terraform"
  }

}