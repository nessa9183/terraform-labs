output "resource_group_name" {
  value = module.rgroup.resource_group_name_output
}

output "location" {
  value = module.rgroup.location_output
}

output "vnet_name" {
  value = module.network.vnet_name_output
}

output "subnet_name" {
  value = module.network.subnet_name_output
}

output "log_workspace_analytics_name" {
  value = module.common.log_analytics_workspace_name_output
}

output "recovery_vault_name" {
  value = module.common.recovery_vault_name_output
}

output "storage_account_output_name" {
  value = module.common.storage_account_name_output
}

output "storage_account_blob_endpoint_output" {
  value = module.common.storage_account_blob_endpoint_output
}

output "linux_hostnames" {
  value = module.vmlinux.vm_hostnames_output
}

output "linux_private_ips" {
  value = module.vmlinux.private_ip_output
}

output "linux_public_ips" {
  value = module.vmlinux.public_ips_output
}

output "windows_hostname" {
  value = module.vmwindows.vm_hostname_output
}

output "windows_private_ip" {
  value = module.vmwindows.private_ip_output
}

output "windows_public_ip" {
  value = module.vmwindows.public_ip_output
}

output "load_balancer_name" {
  value = module.loadbalancer.load_balancer_name_output
}

output "database_name" {
  value = module.database.postgres_database_name_output
}
