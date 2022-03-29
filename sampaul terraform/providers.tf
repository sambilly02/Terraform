terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }



  required_version = ">= 1.1.0"
}



provider "azurerm" {
  features {}
}

provider "azuread" {
  client_id     = "00000000-0000-0000-0000-000000000000"
  client_secret = var.client_secret
  tenant_id     = "10000000-2000-3000-4000-500000000000"
}
provider "azuread" {
  client_id     = "00000000-0000-0000-0000-000000000000"
  client_secret = var.client_secret
  tenant_id     = "10000000-2000-3000-4000-500000000000"
}
