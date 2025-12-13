terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }

 backend "azurerm" {
 # resource_group_name = "fuddu-rg"
 # storage_account_name = "fuddustorageacc"
 # container_name = "fudducontainer"
#  key = "fuddu.terraform.tfstate"

 }

}
provider "azurerm" {
  features {}
  subscription_id = "12070104-5366-47e7-ae69-d5a2bd98c79e"
}
