variable "windows_avs" {
  default = "windows_avs"
}

variable "windows_name" {
  type = map(string)
  default = {
    lab-web-w-vm1 = "Standard_B1s"
    lab-web-w-vm2 = "Standard_B1ms"
  }
}

locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "vanessa.kwende@humber.ca"
    Environment  = "Lab"
  }
}


variable "vm_size" {
  default = "Standard_F2"
}

variable "windows_admin_user" {
  default = "n01390171"
}

variable "admin_password" {
  default = "P@$$word1234!"
}

variable "los_disk_attr" {
  type = map(string)
  default = {
    los_storage_account_type = "StandardSSD_LRS"
    los_disk_size            = "127"
    los_disk_caching         = "ReadWrite"
  }
}

variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  default = "WindowsServer"
}

variable "windows_sku" {
  default = "2016-Datacenter"
}

variable "windows_version" {
  default = "latest"
}

