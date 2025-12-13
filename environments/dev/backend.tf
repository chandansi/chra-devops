 terraform {
  backend "azurerm" {
     resource_group_name  = "ch_rg01"
     storage_account_name = "vmstg007"
     container_name       = "vmcontainer07"
     key                  = "infra.tfstate"
   }  
  
 }
