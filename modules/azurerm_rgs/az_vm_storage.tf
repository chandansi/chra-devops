variable "vm_stg_ac" {
    description = "A map of resource groups and their configurations"
    type = map(object({
         rg_name                         = string
         rg_location                     = string
        storage_account_name            = string
        account_tier                    = string
        account_replication_type        = string
        //storage_container_name          = string
       // container_access_type           = string
       
    }))
}
resource "azurerm_storage_account" "vm_storage"{

  for_each             = var.vm_stg_ac
  name                 = each.value.storage_account_name
  resource_group_name  = each.value.rg_name
  location             = each.value.rg_location
  account_tier         = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  
    depends_on = [
    azurerm_resource_group.vm_resg
  ]
}
# resource "azurerm_storage_container" "vm_container" {
#   for_each            = var.vm_rgss
#   name                = each.value.storage_container_name
#   storage_account_id = azurerm_storage_account.vm_storage[each.key].id

#   container_access_type = "blob"
  
# }
