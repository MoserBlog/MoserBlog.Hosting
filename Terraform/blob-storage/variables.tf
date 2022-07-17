variable "storage_resource_group" {
  default = "moserblog-storage-rg"
  description = "Name of Resource Group that contains all related resources"
}

variable "storage_account_name" {
  default = "moserblogstorage"
  description = "The name of the storage account"
}

variable "container_name_media" {
  default = "media"
  description = "Name of Blob Container"
}

variable "container_name_public" {
  default = "public"
  description = "Name of public Blob Container"
}