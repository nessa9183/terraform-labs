variable "resource_group_name" {
}

variable "location" {
}

variable "common_tags" {
}

variable "windows_avs_name" {
}

variable "vm" {
  type = map(string)
}

variable "os_info" {
  type = map(string)
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

variable "os_disk" {
  type = map(string)
  default = {
    account_type = "Standard_LRS"
    disk_size    = "127"
    caching      = "ReadWrite"
  }
}

variable "admin_user" {
  type = map(string)
  default = {
    username = "n01390171"
    password = "Assignment1!"
  }
  sensitive = true
}

variable "subnet_id" {
}

variable "boot_diagnostics_storage_endpoint" {
}

variable "extension_properties" {
  type = map(string)
  default = {
    name                 = "Antimalware_Extension_4572"
    publisher            = "Microsoft.Azure.Security"
    type                 = "IaaSAntimalware"
    type_handler_version = "1.5"
  }
}
