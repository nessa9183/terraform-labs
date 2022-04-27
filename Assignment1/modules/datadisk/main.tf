# Data disk for each VMs
resource "azurerm_managed_disk" "data_disk" {
  count                = var.disk_count
  name                 = "${var.data_disk_name}-data-disk-${format("%1d", count.index + 1)}"
  resource_group_name  = var.resource_group_name
  location             = var.location
  tags                 = var.common_tags
  storage_account_type = var.data_disk_prop.storage_account_type
  create_option        = var.data_disk_prop.create_option
  disk_size_gb         = var.data_disk_prop.disk_size_gb
}

# Attachment of data disk to VMs
resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count              = var.disk_count
  managed_disk_id    = element(azurerm_managed_disk.data_disk[*].id, count.index + 1)
  virtual_machine_id = element(local.vm_ids[*], count.index + 1)
  lun                = var.data_disk_attach_prop.lun
  caching            = var.data_disk_attach_prop.caching
  depends_on = [
    azurerm_managed_disk.data_disk
  ]
}
