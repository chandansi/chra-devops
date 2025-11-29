# variable "p_var" {
#   description = "A map of public IPs and their configurations"
#   type = map(object({
#     ip_name           = string
#     rg_name           = string
#     rg_location       = string
#     allocation_method = string
#     sku_name          = string
#     domain_name_label = string
#     tags              = map(string)
#     ip_prefix_length  = number
#   }))
# }

variable "p_var" {
  description = "A map of public IPs and their configurations"
  type = map(object({
    ip_name           = string
    rg_name           = string
    rg_location       = string
    allocation_method = string
    sku_name          = string
    domain_name_label = string
    tags              = map(string)
  }))
}

variable "public_ip_name" {
  description = "The name of the public IP address."
  type        = string
  default     = ""
}

variable "rg_name" {
  description = "The name of the resource group where the public IP will be created."
  type        = string
  default     = ""
}

variable "rg_location" {
  description = "The Azure region where the public IP will be created."
  type        = string
  default     = ""
}

variable "allocation_method" {
  description = "The allocation method for the public IP address. Can be 'Static' or 'Dynamic'."
  type        = string
  default     = "Static"
}