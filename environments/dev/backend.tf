terraform {
  backend "azurerm" {
    resource_group_name  = "ch_rg001"
    storage_account_name = "vmst0070"
    container_name       = "vmcontainer07"
    key                  = "infra.tfstate"
  }  
  
}

