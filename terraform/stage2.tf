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
