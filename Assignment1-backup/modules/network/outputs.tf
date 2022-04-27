# OUTPUTS FOR NETWORK MODULE

output "vnet_name_output" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_name_output" {
  value = azurerm_subnet.subnet.name
}

output "subnet_id_output" {
  value = azurerm_subnet.subnet.id
}