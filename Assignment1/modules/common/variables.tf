variable "resource_group_name" {
}

variable "location" {
}

variable "log_analytics_workspace_name" {
}

variable "recovery_vault" {
}

variable "storage_account_name" {
 
}

variable "common_tags" {
}

variable "storage_account_prop" {
  type = map(string)
  default = {
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}