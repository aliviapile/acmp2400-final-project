variable "ARM_CLIENT_ID" {}
variable "ARM_CLIENT_SECRET" {}
variable "DJANGO_SECRET_KEY_PROD" {}

resource "azurerm_container_registry" "apile_acr" {
  name                = "acapileacmp2400"
  resource_group_name = "rg-apile"
  location            = "Central US"
  sku                 = "Basic"
  admin_enabled       = false
}

resource "azurerm_container_group" "apile_aci" {
  name                = "acmp-apile-aci"
  location            = "Central US"
  resource_group_name = "rg-apile"
  ip_address_type     = "Public"
  dns_name_label      = "acmp-apile-instance"
  os_type             = "Linux"

  container {
    name   = "final"
    image  = "acapileacmp2400.azurecr.io/final:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 8000
      protocol = "TCP"
    }

    secure_environment_variables = {
      DJANGO_SECRET_KEY = var.DJANGO_SECRET_KEY_PROD
    }
  }

  image_registry_credential {
    server   = "acapileacmp2400.azurecr.io"
    username = var.ARM_CLIENT_ID
    password = var.ARM_CLIENT_SECRET
  }
}
