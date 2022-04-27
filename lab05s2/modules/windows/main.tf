resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.resource_group
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each              = var.windows_name
  name                  = each.key
  resource_group_name   = var.resource_group
  location              = var.location
  computer_name         = each.key
  size                  = each.value
  admin_username        = var.windows_admin_user.username
  admin_password        = var.windows_admin_user.password
  tags                  = local.common_tags
  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  depends_on            = [var.resource_group]
  availability_set_id   = azurerm_availability_set.windows_avs.id


  winrm_listener {
    protocol = "Http"
  }

  os_disk {
    name                 = "${each.key}-os_disk"
    caching              = var.los_disk_attr["caching"]
    storage_account_type = var.los_disk_attr["account_type"]
    disk_size_gb         = var.los_disk_attr["disk_size"]
  }


  source_image_reference {
    publisher = var.os_info.publisher
    offer     = var.os_info.offer
    sku       = var.os_info.sku
    version   = var.os_info.version
  }
}

resource "azurerm_network_interface" "windows_nic" {
  name                = "${each.key}-nic"
  for_each            = var.windows_name
  location            = var.location
  resource_group_name = var.resource_group
  tags                = local.common_tags
  depends_on          = [var.subnet_association2]

  ip_configuration {
    name                          = "${each.key}-ip"
    subnet_id                     = var.subnet2_id
    public_ip_address_id          = azurerm_public_ip.windows_pip[each.key].id
    private_ip_address_allocation = "Dynamic"

  }

}

resource "azurerm_public_ip" "windows_pip" {
  name                = "${each.key}-pip"
  for_each            = var.windows_name
  location            = var.location
  resource_group_name = var.resource_group
  tags                = local.common_tags
  allocation_method   = "Dynamic"
  depends_on          = [var.resource_group]
}

