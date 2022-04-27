output "linux_availability_set" {
  value = azurerm_availability_set.linux_avs.name
}

output "vm_hostname" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].computer_name]
}

output "private_ip" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].private_ip_address]
}

output "public_ip" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].public_ip_address]
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