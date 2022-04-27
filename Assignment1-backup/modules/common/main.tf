resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.common_tags
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = var.recovery_vault.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.recovery_vault.sku
  storage_mode_type   = var.recovery_vault.storage_mode_type
  tags                = var.common_tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_prop.account_tier
  account_replication_type = var.storage_account_prop.account_replication_type
  tags                     = var.common_tags
  allow_blob_public_access = "true"
}