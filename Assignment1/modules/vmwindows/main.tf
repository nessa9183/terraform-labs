## Resource block to create Availability Set
resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = var.common_tags

}

## Resource block to create Windows Virtual machine
resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                  = "${var.vm.name}-vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm.size
  admin_username        = var.admin_user.username
  admin_password        = var.admin_user.password
  availability_set_id   = azurerm_availability_set.windows_avs.id
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  tags                  = var.common_tags
  
  os_disk {
    name                 = "${var.vm.name}-osdisk"
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.account_type
    disk_size_gb         = var.os_disk.disk_size
  }

  source_image_reference {
    publisher = var.os_info.publisher
    offer     = var.os_info.offer
    sku       = var.os_info.sku
    version   = var.os_info.version
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_endpoint
  }
}

## Resource block for network interface
resource "azurerm_network_interface" "network_interface" {
  name                = "${var.vm.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.common_tags
  
  ip_configuration {
    name                          = "${var.vm.name}-ip"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = "Dynamic"
  }
}

## Resource block for public ip address 
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vm.name}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = var.common_tags
  domain_name_label   = "${var.vm.name}-dns"
}

## Resource block for AntiMalware installation
resource "azurerm_virtual_machine_extension" "antimalware_ext" {
  name                 = var.extension_properties.name
  virtual_machine_id   = azurerm_windows_virtual_machine.windows_vm.id
  publisher            = var.extension_properties.publisher
  type                 = var.extension_properties.type
  type_handler_version = var.extension_properties.type_handler_version
  tags                 = var.common_tags
  depends_on = [
    azurerm_windows_virtual_machine.windows_vm
  ]
}
