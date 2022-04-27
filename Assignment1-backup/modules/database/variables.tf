variable "resource_group_name" {
}

variable "location" {
}

variable "common_tags" {
}

variable "name" {
}

variable "server_sku_name" {
}

variable "server_prop" {
  type        = map(string)
  description = "Stores the value of the PostgreSQL Server"
  default = {
    version                 = 11
    ssl_enforcement_enabled = "true"
  }
}

variable "database_prop" {
  type        = map(string)
  description = "Stores the value of the PostgreSQL Database"
  default = {
    charset   = "UTF8"
    collation = "English_United States.1252"
  }
}

variable "administrator_logon_details" {
  default = {
    username = "psqladmin"
    password = "Assignment1!"
  }
}
