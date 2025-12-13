<<<<<<< HEAD
terraform {
  backend "azurerm" {
    resource_group_name  = "ch_rg01"
    storage_account_name = "vmstg007"
    container_name       = "vmcontainer07"
    key                  = "infra.tfstate"
  }  
  
}
=======
 terraform {
  backend "azurerm" {
    # resource_group_name  = "ch_rg01"
    # storage_account_name = "vmstg007"
    # container_name       = "vmcontainer07"
    # key                  = "infra.tfstate"
   }  
  
 }
>>>>>>> 44832c75df7082e36abdcd12598cf7f90a840f0e
