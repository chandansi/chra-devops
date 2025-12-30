
variable "vm_ser" {
    description = "A map of sql servers and their configurations"
    type = map(object({
        server_name                     = string
        rg_name                         = string
        rg_location                     = string
        version                         = string
        minimum_tls_version             = string
        administrator_login             = string
        administrator_login_password    = string
    }))
  
}
