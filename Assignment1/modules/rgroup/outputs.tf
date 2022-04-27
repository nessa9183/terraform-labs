## OUTPUTS FOR RESOURCE GROUP MODULE

output "resource_group_name_output" {
  value = azurerm_resource_group.resource_group.name
}

output "location_output" {
  value = azurerm_resource_group.resource_group.location
}
