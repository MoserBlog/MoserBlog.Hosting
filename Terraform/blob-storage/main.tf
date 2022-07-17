terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.14.0"
    }
  }
}

provider "azurerm" {
    features {}
}


resource "azurerm_resource_group" "mb_storage_rg" {
  name     = var.storage_resource_group
  location = "West Europe"
}

resource "azurerm_storage_account" "mb_storage_ac" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.mb_storage_rg.name
  location                 = azurerm_resource_group.mb_storage_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "mb_storage_container_media" {
  name                  = var.container_name_media
  storage_account_name  = azurerm_storage_account.mb_storage_ac.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "mb_storage_container_public" {
  name                  = var.container_name_public
  storage_account_name  = azurerm_storage_account.mb_storage_ac.name
  container_access_type = "container"
}