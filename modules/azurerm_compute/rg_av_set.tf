variable "avset" {
  description = "A map of availability set configurations."
  type = map(object({
    aset_name    = string
    rg_name      = string
    rg_location  = string
    platform_update_domain_count = number
    platform_fault_domain_count  = number
    managed                      = bool
    tags         = map(string) 
  }))
  
}

resource "azurerm_availability_set" "a_set" {
  for_each = var.avset
  name                = each.value.aset_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
  platform_update_domain_count = each.value.platform_update_domain_count
  platform_fault_domain_count  = each.value.platform_fault_domain_count
  managed                      = each.value.managed

  tags = {
    environment = "Production"
  }
}