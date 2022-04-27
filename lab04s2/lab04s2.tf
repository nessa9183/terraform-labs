resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = azurerm_resource_group.rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each              = var.windows_name
  name                  = each.key
  resource_group_name   = var.rg
  location              = var.location
  computer_name         = each.key
  size                  = each.value
  admin_username        = var.windows_admin_user
  tags                  = local.common_tags
  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  depends_on            = [azurerm_resource_group.rg]
  availability_set_id   = azurerm_availability_set.windows_avs.id
  admin_password        = var.admin_password
  
  winrm_listener {
    protocol = "Http"
  }

  os_disk {
    name                 = "${each.key}-os_disk"
    caching              = var.los_disk_attr["los_disk_caching"]
    storage_account_type = var.los_disk_attr["los_storage_account_type"]
    disk_size_gb         = var.los_disk_attr["los_disk_size"]
  }


  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
  }
}

resource "azurerm_network_interface" "windows_nic" {
  name                = "${each.key}-nic"
  for_each            = var.windows_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
  depends_on          = [azurerm_subnet_network_security_group_association.subnet_association]

  ip_configuration {
    name                          = each.key
    subnet_id                     = azurerm_subnet.subnet.id
    public_ip_address_id          = azurerm_public_ip.windows_pip[each.key].id
    private_ip_address_allocation = "Dynamic"

  }

}

resource "azurerm_public_ip" "windows_pip" {
  name                = "${each.key}-pip"
  for_each            = var.windows_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
  allocation_method   = "Dynamic"

}
