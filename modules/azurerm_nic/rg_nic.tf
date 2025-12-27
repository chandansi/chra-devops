variable "vm_nic" {
  description = "A map of nic"
  type = map(object({
    nic_name = string
    rg_location = string
    rg_name = string  
    ip_configuration_name = string
    private_ip_address_allocation = string
    subnet_id = string  
    

  }))
}

resource "azurerm_network_interface" "nic_resources07" {
  for_each = var.vm_nic
  name                = each.value.nic_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
  

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    
  }
  
}