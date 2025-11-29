variable "vm_kv" {
  description = "A map of resource group configurations"
  type = map(object({
    kv_name                 = string
    rg_name               = string
    rg_location              = string  
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    tenant_id            = string
    sku_name            = string
    # access_policy    = list(object({
    #   tenant_id = string
    #   object_id = string
    #   key_permissions = list(string)
    #   secret_permissions = list(string)
    #   storage_permissions = list(string)

    # }))   
  }))
}

resource "azurerm_key_vault" "vm_kvault" {
  for_each = var.vm_kv
  name                        = each.value.kv_name
  location                    = each.value.rg_location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = each.value.tenant_id
  soft_delete_retention_days = each.value.soft_delete_retention_days
  purge_protection_enabled    = false
  sku_name = "standard"

  #   network_acls {
  #   default_action = "Allow"
  #   bypass         = "AzureServices"
  # }

  # access_policy {
  #   tenant_id = each.value.access_policy[0].tenant_id
  #   object_id = each.value.access_policy[0].object_id

  #   key_permissions = [
  #     "Get",
  #   ]

  #   secret_permissions = [
  #     "Get",
  #   ]

  #   storage_permissions = [
  #     "Get",
  #   ]
  # }
#   access_policy {
#     tenant_id = each.value.access_policy[1].tenant_id
#     object_id = each.value.access_policy[1].object_id

#     key_permissions = [
#       "Get",
#     ]

#     secret_permissions = [
#       "Get",
#     ]

#     storage_permissions = [
#       "Get",
#     ]
#   }
#   lifecycle {
#   create_before_destroy = true
# }
}