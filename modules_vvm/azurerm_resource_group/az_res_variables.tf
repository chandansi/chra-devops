variable "vm_rgss" {
    description = "A map of resource groups and their configurations"
    type = map(object({
        rg_name                       = string
        location                      = string
        vnet_name                     = string
        vnet_address_space            = list(string)
        vnet_location                 = string
        subnet_name                   = string
        subnet_address_prefixes       = list(string)
        nic_name                      = string
        nic_location                  = string
        ip_configuration_name         = string
        subnet_id                     = string
        private_ip_address_allocation = string
        vm_name                       = string
        admin_ssh_key_username        = string
        admin_ssh_key_public_key      = string
        os_disk_caching               = string
        os_disk_storage_account_type  = string
        source_image_publisher        = string
        source_image_offer            = string  
        source_image_sku              = string
        source_image_version          = string
    }))
}