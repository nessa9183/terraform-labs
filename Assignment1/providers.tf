# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.97.0"
    }
  }
  required_version = "~> 1.1.2"
}
