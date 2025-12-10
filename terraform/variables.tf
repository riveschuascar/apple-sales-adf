# Authentification variables
variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "client_id" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "tenant_id" {
  type      = string
  sensitive = true
}

# Location variable
variable "location" {
  type = string
}

# Resource Group variables
variable "resource_group_name" {
  type      = string
  sensitive = true
}

# Storage Account variables
variable "storage_account_name" {
  type      = string
  sensitive = true
}

# SQL Server variables
variable "sql_server_name" {
  type      = string
  sensitive = true
}

variable "sql_admin_username" {
  type      = string
  sensitive = true
}

variable "sql_admin_password" {
  type      = string
  sensitive = true
}

variable "sql_database_name" {
  type      = string
  sensitive = true
}

variable "sql_firewall_rule_name" {
  type      = string
  sensitive = true
}

# Datafactory variables
variable "data_factory_name" {
  type      = string
  sensitive = true
}
