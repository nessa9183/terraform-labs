terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate0171RG"
    storage_account_name = "tfstate0171sa"
    container_name       = "tfstate0171container"
    key                  = "Assignment1.terraform.tfstate"
  }
}