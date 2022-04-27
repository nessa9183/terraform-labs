## OUTPUTS FOR WINDOWS MODULE

output "vm_hostname_output" {
  value = azurerm_windows_virtual_machine.windows_vm.computer_name
}

output "private_ip_output" {
  value = azurerm_windows_virtual_machine.windows_vm.private_ip_address
}

output "public_ip_output" {
  value = azurerm_windows_virtual_machine.windows_vm.public_ip_address
}

## For use in Data Disk Module
output "vm_id_output" {
  value = azurerm_windows_virtual_machine.windows_vm.id
}

