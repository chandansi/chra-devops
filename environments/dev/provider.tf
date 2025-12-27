terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.48.0"
    }
  }

}
provider "azurerm" {
  subscription_id = "2d56d9b3-4522-4609-bac1-d4af7eea379e"
  tenant_id       = "175676df-2563-43c5-9e4f-af83c4ef4ff2"

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}