## OUTPUTS FOR LINUX MODULE

output "vm_hostnames_output" {
  value = azurerm_linux_virtual_machine.linux_vm[*].computer_name
}

output "private_ip_output" {
  value = azurerm_linux_virtual_machine.linux_vm[*].private_ip_address
}

output "public_ips_output" {
  value = azurerm_linux_virtual_machine.linux_vm[*].public_ip_address
}

output "vm_dns_names" {
  value = azurerm_public_ip.public_ip[*].fqdn
}

## For use in Data Disk Module
output "vm_ids_output" {
  value = azurerm_linux_virtual_machine.linux_vm[*].id
}

## For use in Load Balancer Module
output "vm_nics_output" {
  value = azurerm_network_interface.network_interface[*]
}


