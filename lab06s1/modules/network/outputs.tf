output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_addr_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet" {
  value = azurerm_subnet.subnet.name
}

output "subnet2" {
  value = azurerm_subnet.subnet2.name
}

output "subnet_space" {
  value = azurerm_subnet.subnet.address_prefixes
}

output "subnet2_space" {
  value = azurerm_subnet.subnet2.address_prefixes
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "subnet2_id" {
  value = azurerm_subnet.subnet2.id
}

output "subnet_association" {
  value = azurerm_subnet_network_security_group_association.subnet_association.id
}

output "subnet_association2" {
  value = azurerm_subnet_network_security_group_association.subnet_association2.id
}