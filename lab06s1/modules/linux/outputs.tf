output "linux_hostname" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].computer_name]
}

output "private_ip" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].private_ip_address]
}

output "public_ip" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].public_ip_address]
}

output "vm_dns_names" {
  value = azurerm_public_ip.public_ip[*].fqdn
}