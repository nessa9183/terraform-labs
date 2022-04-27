resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.resource_group
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_linux_virtual_machine" "vmlinux" {
  count                 = var.nb_count
  name                  = "${var.linux_name}-vm${format("%1d", count.index + 1)}"
  resource_group_name   = var.resource_group
  location              = var.location
  computer_name         = "${var.linux_name}-vm${format("%1d", count.index + 1)}"
  size                  = var.vm_size
  admin_username        = var.linux_admin_user
  tags                  = local.common_tags
  network_interface_ids = [element(azurerm_network_interface.linux_nic[*].id, count.index + 1)]
  depends_on            = [var.resource_group]
  availability_set_id   = azurerm_availability_set.linux_avs.id

  admin_ssh_key {
    username   = var.linux_admin_user
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${var.linux_name}-os_disk${format("%1d", count.index + 1)}"
    caching              = var.los_disk_attr["caching"]
    storage_account_type = var.los_disk_attr["account_type"]
    disk_size_gb         = var.los_disk_attr["disk_size"]
  }

  source_image_reference {
    publisher = var.linux_publisher
    offer     = var.linux_offer
    sku       = var.linux_sku
    version   = var.linux_version
  }
}

resource "azurerm_network_interface" "linux_nic" {
  name                = "${var.linux_name}-nic${format("%1d", count.index + 1)}"
  count               = var.nb_count
  location            = var.location
  resource_group_name = var.resource_group
  tags                = local.common_tags
  depends_on          = [var.subnet_association]

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = element(azurerm_public_ip.public_ip[*].id, count.index + 1)
    private_ip_address_allocation = "Dynamic"

  }

}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.linux_name}-pip${format("%1d", count.index + 1)}"
  count               = var.nb_count
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Dynamic"
  depends_on          = [var.resource_group]
  domain_name_label   = "${var.linux_name}-dns-${format("%1d", count.index + 1)}"
  tags                = local.common_tags

}
