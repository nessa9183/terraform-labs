variable "resource_group_name" {
}

variable "location" {
}

variable "common_tags" {
}

variable "disk_count" {
}

locals {
  vm_ids  = concat(var.linux_vm_ids, [var.windows_vm_id])
  description = "This variable stores ids of Linux VM and Windows VM"
}

variable "data_disk_name" {
}

variable "data_disk_prop" {
  type    = map(string)
}

variable "linux_vm_ids" {
}

variable "windows_vm_id" {
}

variable "data_disk_attach_prop" {
  type = map(string)
  default = {
    lun     = "0"
    caching = "None"
  }
}
