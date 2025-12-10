terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.23.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Storage Account
resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_container" "raw" {
  name                  = "datos-bruto"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "categoria" {
  name                   = "categoria.csv"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.raw.name
  type                   = "Block"
  source                 = "datasets/category.csv"
}

resource "azurerm_storage_blob" "productos" {
  name                   = "productos.csv"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.raw.name
  type                   = "Block"
  source                 = "datasets/products.csv"
}

resource "azurerm_storage_blob" "ventas" {
  name                   = "ventas.csv"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.raw.name
  type                   = "Block"
  source                 = "datasets/sales.csv"
}

resource "azurerm_storage_blob" "tiendas" {
  name                   = "tiendas.csv"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.raw.name
  type                   = "Block"
  source                 = "datasets/stores.csv"
}

resource "azurerm_storage_blob" "garantia" {
  name                   = "garantia.csv"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.raw.name
  type                   = "Block"
  source                 = "datasets/warranty.csv"
}

# SQL Server
resource "azurerm_mssql_server" "main" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.main.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_firewall_rule" "firewall" {
  name             = var.sql_firewall_rule_name
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}

resource "azurerm_mssql_database" "main" {
  name         = var.sql_database_name
  server_id    = azurerm_mssql_server.main.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  # Prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}

# Data Factory
resource "azurerm_data_factory" "main" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}
