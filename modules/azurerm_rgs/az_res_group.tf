variable "vm_rgss01" {
  type = map(object({
    rg_name       = string
    rg_location   =string
  }))
}

resource "azurerm_resource_group" "vm_resg" {
  for_each = var.vm_rgss01
  name     = each.value.rg_name
  location = each.value.rg_location
}



