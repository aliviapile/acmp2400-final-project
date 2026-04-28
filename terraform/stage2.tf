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

resource "azurerm_container_group" "app" {
  name                = "acmp2400-container"
  location            = "Central US"
  resource_group_name = "rg-apile"
  ip_address_type     = "Public"
  dns_name_label      = "apile-acmp2400"
  os_type             = "Linux"

  container {
    name   = "final-app"
    image  = "acapileacmp2400.azurecr.io/final:latest"
    cpu    = "1"
    memory = "1.5"

    ports {
      port     = 8000
      protocol = "TCP"
    }
  }

  exposed_port {
    port     = 8000
    protocol = "TCP"
  }

  image_registry_credential {
    server   = "acapileacmp2400.azurecr.io"
    username = var.acr_username
    password = var.acr_password
  }
}

variable "acr_username" {}
variable "acr_password" {}
