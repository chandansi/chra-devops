variable "vm_nsg1" {
  description = "A map of network security group configurations for virtual machines."
  type = map(object({
    nsg_name    = string
    rg_name     = string
    rg_location = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
    tags        = map(string) 
  }))
  
}

resource "azurerm_network_security_group" "vm_nsg" {
  for_each = var.vm_nsg1
  name                = each.value.nsg_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}