
output "linux_rg" {
  value = module.resource_group.linux_rg
}

output "windows_rg" {
  value = module.resource_group.windows_rg
}

output "network_rg" {
  value = module.resource_group.network_rg
}

output "vnet" {
  value = module.network.vnet_name
}

output "vnet_addr_space" {
  value = module.network.vnet_addr_space
}

output "subnet" {
  value = module.network.subnet
}

output "subnet2" {
  value = module.network.subnet2
}

output "subnet_space" {
  value = module.network.subnet_space
}

output "subnet2_space" {
  value = module.network.subnet2_space
}

output "linux_hostnames" {
  value = module.linux.linux_hostname
}

output "private_ip" {
  value = module.linux.private_ip
}

output "public_ip" {
  value = module.linux.public_ip
}

output "vm_dns_names" {
  value = module.linux.vm_dns_names
}

output "windows_hostnames" {
  value = module.windows.windows_hostname
}

output "windows_private_ip" {
  value = module.windows.windows_private_ip
}

output "windows_public_ip" {
  value = module.windows.windows_public_ip
}