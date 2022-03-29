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
  client_id     = "637266ad-6607-4ad3-87ed-6b16f8e24548"
  client_secret = var.client_secret
  tenant_id     = "0354a672-9919-4a99-bfc6-e760f06753ee"
}

