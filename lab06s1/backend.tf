terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01390171-RG"
    storage_account_name = "tfstaten01390171sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
} 