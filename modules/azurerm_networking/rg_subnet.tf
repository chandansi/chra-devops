variable "vm_sub" {
  description = "A map of subnet configurations for virtual networks."
  type = map(object({
    subnet_name            = string
    rg_name                = string
    vnet_name              = string
    subnet_address_prefixes = list(string)
  }))
  
}


resource "azurerm_subnet" "subnet_resources07" {
 for_each = var.vm_sub
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.subnet_address_prefixes

  
  depends_on = [
    azurerm_virtual_network.vnet_resources07
  ]
}