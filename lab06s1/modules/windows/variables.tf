locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "vanessa.kwende@humber.ca"
    Environment  = "Lab"
  }
}

variable "resource_group" {
}

variable "location" {
}

variable "windows_avs" {
}

variable "windows_name" {
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

variable "los_disk_attr" {
  type = map(string)
  default = {
    account_type = "StandardSSD_LRS"
    disk_size    = "127"
    caching      = "ReadWrite"
  }
}

variable "windows_admin_user" {
  type = map(string)
  default = {
    username = "n01390171"
    password = "P@$$word1234!"
  }
  sensitive = true
}

variable "subnet2_id" {
}

variable "subnet_association2" {
}
