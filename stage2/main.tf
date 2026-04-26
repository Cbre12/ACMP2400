variable ARM_CLIENT_ID {}
variable ARM_CLIENT_SECRET {}
variable DJANGO_SECRET_KEY {}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "rg-acmp-final"
    storage_account_name = "acmp2400storageaccount"
    container_name = "big-tf-state-acmp2400"
    use_azuread_auth = true
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_container_registry" "colebreinig-acr" {
  name = "acrcolebreinigacmp2400"
  resource_group_name = "rg-colebreinig"
  location = "Central US"
  sku = "Basic"
  admin_enabled = false
}

resource "azurerm_container_group" "aci-colebreinig-acmp" {
  name                = "aci-colebreinig-acmp"
  location            = "Central US"
  resource_group_name = "rg-colebreinig"
  ip_address_type     = "Public"
  dns_name_label      = "aci-colebreinig-acmp"
  os_type             = "Linux"

  container {
    name   = "final-app"
    image  = "acrcolebreinigacmp2400.azurecr.io/final:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 8000
      protocol = "TCP"
    }
  }
  image_registry_credential
    server = "acrcolebreinigacmp2400.azurecr.io"
    username = var.ARM_CLIENT_ID
    password = var.ARM_CLIENT_SECRET
  }
}
