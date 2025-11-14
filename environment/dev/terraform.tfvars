vm_rgss ={
    rgs01 = {
        rg_name     = "vm-rg07"
        location = "centralindia"
        vnet_name   = "vnet_rg07"
        vnet_address_space = ["10.0.0.0/16"]
        vnet_location = "centralindia"
        subnet_name = "internal07"
        subnet_address_prefixes = ["10.0.2.0/24"]   
        nic_name   = "vm-nic07"
        nic_location = "centralindia"
        ip_configuration_name = "internal"
        subnet_id = ""  # to be filled after subnet creation
        private_ip_address_allocation = "Dynamic"
        vm_name = "my-linux-vm"
        vm_location = "centralindia"
        admin_ssh_key_username = "adminuser"
        admin_ssh_key_public_key = "~/.ssh/id_rsa.pub"
        os_disk_caching = "ReadWrite"
        os_disk_storage_account_type = "Standard_LRS"
        source_image_publisher = "Canonical"
        source_image_offer = "UbuntuServer"
        source_image_sku = "18.04-LTS"
        source_image_version = "latest"


    }
}