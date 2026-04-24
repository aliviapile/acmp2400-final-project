terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-acmp-final"
    storage_account_name = "acmp2400storageaccount"
    container_name       = "big-tf-state-acmp2400"
    key                  = "apile"
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f9dd3451-71c1-4bd8-84f8-c83195ce534e"
}

resource "azurerm_container_registry" "aliviapile_acr" {
  name                = "acapileacmp2400"
  resource_group_name = "rg-aliviapile"
  location            = "Central US"
  sku                 = "Basic"
  admin_enabled       = false
}
