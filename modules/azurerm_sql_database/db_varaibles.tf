variable "vmdb" {
    description = "A map of sql databases and their configurations"
    type = map(object({
        database_name                  = string
        server_id                      = string
        collation                      = string
        license_type                   = string
        max_size_gb                    = number
        sku_name                       = string
        enclave_type                   = string
        tags                           = map(string)  

     }))
  
}

