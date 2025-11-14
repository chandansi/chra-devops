terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }

#  backend "azurerm" {
#   resource_group_name = "rai-rg-t01"
#   storage_account_name = "chandanstorageacct01"
#   container_name = "practice01"
#   key = "containerstate.tf"
#  }

}
provider "azurerm" {
  features {}
  subscription_id = "02fc6674-9e4d-4764-8702-0c4550e06df7"
}