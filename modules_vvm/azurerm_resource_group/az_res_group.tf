resource "azurerm_resource_group" "fuddu" {
  for_each = var.vm_rgss
  name     = each.value.rg_name
  location = each.value.location
}
