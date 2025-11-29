
variable "vm_ser" {
    description = "A map of sql servers and their configurations"
    type = map(object({
        server_name                     = string
        resource_group_name             = string
        location                        = string
        version                         = string
        administrator_login             = string
        administrator_login_password    = string
    }))
  
}
