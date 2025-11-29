variable "vnet_infra" {
  description = "A map of virtual network configurations for infrastructure resources."
  type = map(object({
    vnet_name          = string
    vnet_address_space = list(string)
    rg_name            = string
    rg_location        = string
  }))
  
}

resource "azurerm_virtual_network" "vnet_resources07" {
  for_each = var.vnet_infra
  name                = each.value.vnet_name
  address_space       = each.value.vnet_address_space
  location            = each.value.rg_location

  resource_group_name = each.value.rg_name
}