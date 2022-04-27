output "log_analytics_workspace_name_output" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace.name
}

output "recovery_vault_name_output" {
  value = azurerm_recovery_services_vault.recovery_vault.name
}

output "storage_account_name_output" {
  value = azurerm_storage_account.storage_account.name
}
output "storage_account_blob_endpoint_output" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}
