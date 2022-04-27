locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "vanessa.kwende@humber.ca"
    Environment  = "Lab"
  }
}

variable "linux_name" {
  default = "lab03s2-db1-u-vm1"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "linux_admin_user" {
  default = "n01390171"
}

variable "pub_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "los_disk_attr" {
  type = map(string)
  default = {
    los_storage_account_type = "Premium_LRS"
    los_disk_size            = "32"
    los_disk_caching         = "ReadWrite"
  }
}

variable "linux_publisher" {
  default = "Canonical"
}

variable "linux_offer" {
  default = "UbuntuServer"
}

variable "linux_sku" {
  default = "19.04"
}

variable "linux_version" {
  default = "latest"
}