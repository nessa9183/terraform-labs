
locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "vanessa.kwende@humber.ca"
    Environment  = "Lab"
  }
}

variable "linux_avs" {
}

variable "resource_group" {
}

variable "location" {
}

variable "nb_count" {
}

variable "linux_name" {
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

variable "los_disk_attr" {
  type = map(string)
  default = {
    account_type = "Premium_LRS"
    disk_size    = "32"
    caching      = "ReadWrite"
  }
}

variable "linux_admin_user" {
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

variable "subnet_association" {
}

variable "vm_size" {
}