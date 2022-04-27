output "windows_availability_set" {
  value = azurerm_availability_set.windows_avs.name
}

output "windows_hostname" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].name
}

output "public_ip" {
 value = values(azurerm_public_ip.windows_pip)[*].name
}

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