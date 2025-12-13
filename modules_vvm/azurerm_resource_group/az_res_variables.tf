variable "vm_rgss" {
    description = "A map of resource groups and their configurations"
    type = map(object({
        rg_name                       = string
        location                      = string
      
    }))
}
