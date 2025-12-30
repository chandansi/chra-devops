
avset = {
  avset1 = {
    aset_name                    = "avset071"
    rg_name                      = "ch_rg001"
    rg_location                  = "West Europe"
    platform_update_domain_count = 5
    platform_fault_domain_count  = 2 # <= FIXED
    managed                      = true
    tags = {
      environment = "dev"
    }
  }

}
vm_nic = {
  nic01 = {
    nic_name                      = "vm-nic070"
    rg_location                   = "West Europe"
    rg_name                       = "ch_rg001"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "/subscriptions/2d56d9b3-4522-4609-bac1-d4af7eea379e/resourceGroups/ch_rg001/providers/Microsoft.Network/virtualNetworks/vnet-rg070/subnets/internal0701"

  }
  nic02 = {
    nic_name                      = "vm-nic-bckend1"
    rg_location                   = "West Europe"
    rg_name                       = "ch_rg001"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "/subscriptions/2d56d9b3-4522-4609-bac1-d4af7eea379e/resourceGroups/ch_rg001/providers/Microsoft.Network/virtualNetworks/vnet-rg070/subnets/internal_bckend1"

  }

}

vm = {
  vm1 = {
    rg_name                = "ch_rg001"
    rg_location            = "West Europe"
    availability_set_id    = "" # to be filled after AV set creation
    vm_name                = "my-linux-vm-frontend"
    vm_size                = "Standard_D2s_v3"
    vm_zone                = null
    admin_ssh_key_username = "adminuser"
    network_interface_ids  = ["/subscriptions/2d56d9b3-4522-4609-bac1-d4af7eea379e/resourceGroups/ch_rg001/providers/Microsoft.Network/networkInterfaces/vm-nic070"]
    #  network_interface_ids  = [module.rgvm.azurerm_network_interface.nic_resources07["nic01"].id]

    admin_ssh_key = {
      username        = "adminuser"
      public_key_path = "~/.ssh/id_rsa.pub"

    }
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }

  }
  vm2 = {
    rg_name                = "ch_rg001"
    rg_location            = "West Europe"
    availability_set_id    = "" # to be filled after AV set creation
    vm_name                = "my-linux-vm-bckend"
    vm_size                = "Standard_D2s_v3"
    vm_zone                = null
    admin_ssh_key_username = "adminuser"
    network_interface_ids  = ["/subscriptions/2d56d9b3-4522-4609-bac1-d4af7eea379e/resourceGroups/ch_rg001/providers/Microsoft.Network/networkInterfaces/vm-nic-bckend1"]
    # network_interface_ids  = [module.rgvm.azurerm_network_interface.nic_resources07["nic02"].id]
    admin_ssh_key = {
      username        = "adminuser"
      public_key_path = "~/.ssh/id_rsa.pub"

    }
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }

  }
}


vm_kv = {
  vm_kv01 = {
    kv_name                     = "ch007kv1"
    rg_name                     = "ch_rg001"
    rg_location                 = "West Europe"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    tenant_id                   = "175676df-2563-43c5-9e4f-af83c4ef4ff2"
    sku_name                    = "Standard"
    purge_on_destroy            = true
    enable_purge_protection     = false
    access_policy = [
      {
        tenant_id           = "175676df-2563-43c5-9e4f-af83c4ef4ff2"
        object_id           = "e99ccb03-11c4-4a60-bce5-4b548651be2d"
        key_permissions     = ["get", "list", "create", "delete"]
        secret_permissions  = ["get", "list", "set", "delete"]
        storage_permissions = ["get", "list", "set", "delete"]
      },
      {
        tenant_id           = "175676df-2563-43c5-9e4f-af83c4ef4ff2"
        object_id           = "e99ccb03-11c4-4a60-bce5-4b548651be2d" # VM2
        key_permissions     = ["get", "list", "create", "delete"]
        secret_permissions  = ["get", "list", "set", "delete"]
        storage_permissions = ["get", "list", "set", "delete"]
      }
    ]
  }

}

vm_nsg1 = {
  nsg01 = {
    nsg_name    = "vm-nsg007"
    rg_name     = "ch_rg001"
    rg_location = "West Europe"
    security_rules = [
      {
        name                       = "AllowSSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    tags = {
      environment = "dev"
    }
  }
  nsg02 = {
    nsg_name    = "vm-nsg-backend1"
    rg_name     = "ch_rg001"
    rg_location = "West Europe"
    security_rules = [
      {
        name                       = "AllowSSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    tags = {
      environment = "dev"
    }
  }

}


vm_sub = {
  subnet01 = {
    subnet_name             = "internal0701"
    rg_name                 = "ch_rg001"
    rg_location             = "West Europe"
    vnet_name               = "vnet-rg070"
    subnet_address_prefixes = ["10.0.2.0/24"]

  }
  subnet02 = {
    subnet_name             = "internal_bckend1"
    rg_name                 = "ch_rg001"
    rg_location             = "West Europe"
    vnet_name               = "vnet-rg070"
    subnet_address_prefixes = ["10.0.3.0/24"]

  }
}

vnet_infra = {
  vnet01 = {
    vnet_name          = "vnet-rg070"
    vnet_address_space = ["10.0.0.0/16"]
    rg_name            = "ch_rg001"
    rg_location        = "West Europe"
  }
}

p_var = {
  p_ip01 = {
    ip_name           = "vm-pip010"
    rg_name           = "ch_rg001"
    rg_location       = "West Europe"
    allocation_method = "Static"
    sku_name          = "Standard"
    domain_name_label = "vm-pip01-label"
    tags = {
      environment = "dev"
    }
  }

  p_ip02 = {
    ip_name           = "vm-pip020"
    rg_name           = "ch_rg001"
    rg_location       = "West Europe"
    allocation_method = "Static"
    sku_name          = "Standard"
    domain_name_label = "vm-pip02-label"
    tags = {
      environment = "dev"
    }
  }
}



vm_rgss01 = {
  rgs01 = {
    rg_name     = "ch_rg001"
    rg_location = "West Europe"
    managed_by  = "chandan"

    //storage_container_name         = "vmcontainer07"
    //container_access_type          = "private"

  }
}
vm_stg_ac = {
  stg_ac01 = {
    rg_name                  = "ch_rg001"
    rg_location              = "West Europe"
    storage_account_name     = "vmst0070"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    storage_container_name   = "vmcontainer07"
    container_access_type    = "private"

  }
}
vm_ser = {
  vm_ser01 = {
    server_name                  = "vm-sqlserver007"
    rg_name                      = "ch_rg001"
    rg_location                  = "North Europe"
    version                      = "12.0"
    administrator_login          = "sqladminuser"
    minimum_tls_version          = "1.2"
    administrator_login_password = "P@ssw0rd1234"
  }
}
vmdb = {
  vmdb01 = {
    database_name = "vmdatabase007"
    server_name   = "vm-sqlserver007"  # Links to vm_ser map
    server_resource_group = "ch_rg001"
    server_key    = "vm_ser01"  # Links to vm_ser map
    collation     = "SQL_Latin1_General_CP1_CI_AS"
    license_type  = "LicenseIncluded"
    max_size_gb   = 5
    sku_name      = "S0"
    enclave_type  = "Default"
    tags = {
      environment = "dev"
     }
}
}
