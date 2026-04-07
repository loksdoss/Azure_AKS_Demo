terraform {

  required_version = ">=1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "tfstateaksdemo367"
    container_name       = "tfstate"
    key                  = "aks-demo.tfstate"
  }

}

provider "azurerm" {
  features {}
}