
variable "vm" {
  description = "A map of vm"
  type = map(object({
    rg_name = string
    rg_location = string
    vm_name = string
    vm_size = optional(string,null)
    vm_zone = string
    admin_ssh_key_username = string
    network_interface_ids = list(string)
    admin_ssh_key = object({
      username   = string
      public_key_path = string
    })
    os_disk = object({
      caching              = string
      storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
     sku       = string
      version   = string
    })
    
  }))

}
# Path to SSH public key
variable "public_key_path" {
  description = "Path to the SSH public key for VM"
  type        = string
}

resource "azurerm_linux_virtual_machine" "lin-vm" {
  for_each = var.vm
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location
  size                = each.value.vm_size
  zone               = each.value.vm_zone
  admin_username      = each.value.admin_ssh_key_username
  network_interface_ids = var.vm[each.key].network_interface_ids
  
  
  # depends_on = [
  #   azurerm_network_interface.nic_resources07
  # ]
  admin_ssh_key {
    username   = each.value.admin_ssh_key.username
    public_key = file(var.public_key_path)
  

  }

  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}