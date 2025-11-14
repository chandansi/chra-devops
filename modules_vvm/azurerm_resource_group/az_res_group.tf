resource "azurerm_resource_group" "vm_resources07" {
  for_each = var.vm_rgss
  name     = each.value.rg_name
  location = each.value.location
}

resource "azurerm_virtual_network" "vnet_resources07" {
  for_each = var.vm_rgss
  name                = each.value.vnet_name
  address_space       = each.value.vnet_address_space
  location            = azurerm_resource_group.vm_resources07[each.key].location

  resource_group_name = each.value.rg_name
}

resource "azurerm_subnet" "subnet_resources07" {
 for_each = var.vm_rgss
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.subnet_address_prefixes

  
  depends_on = [
    azurerm_virtual_network.vnet_resources07
  ]
}

resource "azurerm_network_interface" "nic_resources07" {
  for_each = var.vm_rgss
  name                = each.value.nic_name
  location            = azurerm_resource_group.vm_resources07[each.key].location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = azurerm_subnet.subnet_resources07[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "lin-vm" {
  for_each = var.vm_rgss
  name                = each.value.vm_name
  resource_group_name = azurerm_resource_group.vm_resources07[each.key].name
  location            = azurerm_resource_group.vm_resources07[each.key].location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic_resources07[each.key].id
  ]

  admin_ssh_key {
    username   = each.value.admin_ssh_key_username
    public_key = file("~/.ssh/id_rsa.pub")
  

  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}