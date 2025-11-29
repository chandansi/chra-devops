terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.48.0"
    }
  }
  # backend "azurerm" {

  # }

  #  backend "azurerm" {
  #   resource_group_name = "rai-rg-t01"
  #   storage_account_name = "chandanstorageacct01"
  #   container_name = "practice01"
  #   key = "containerstate.tf"
  #  }

}
provider "azurerm" {
  subscription_id = "12070104-5366-47e7-ae69-d5a2bd98c79e"

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
  }
  }  
}