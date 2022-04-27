## VARIABLES FOR LINUX MODULE

## LOCALS
variable "common_tags" {
}

## VARIABLE FOR AVAILABILITY SET
variable "linux_avs_name" {
  # default = "linux_avs"
}

variable "resource_group_name" {
}

variable "location" {
}

## VARIABLE FOR COUNT
variable "count_val" {
}

## VARIABLES FOR VIRTUAL MACHINE RESOURCES 
variable "vm" {
}

variable "os_info" {
  type = map(string)
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "8.2.2020062400"
  }
}

variable "os_disk" {
  type = map(string)
  default = {
    account_type = "Standard_LRS"
    disk_size    = "32"
    caching      = "ReadWrite"
  }
}

variable "admin_user" {
  default = "n01390171"
}

variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "~/.ssh/id_rsa"
}

variable "subnet_id" {
}

variable "boot_diagnostics_storage_endpoint" {
}

## VARIABLES FOR PROPERTIES FOR NETWORK WATCHER EXTENSION
variable "extension_properties" {
  type = map(string)
  default = {
    name                 = "Network_Watcher_4572"
    publisher            = "Microsoft.Azure.NetworkWatcher"
    type                 = "NetworkWatcherAgentLinux"
    type_handler_version = "1.4"
  }
}
