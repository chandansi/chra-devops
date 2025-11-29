module "resource_group" {
  source    = "../../modules/azurerm_rgs"
  vm_rgss01 = var.vm_rgss01
  vm_stg_ac = var.vm_stg_ac


}

# module "storage_account_name" {
#   source  = "../../modules/azurerm_rgs"
#   vm_stg_ac = var.vm_stg_ac
#   depends_on = [ module.resource_group ]
# }

module "network" {
  source     = "../../modules/azurerm_networking"
  vnet_infra = var.vnet_infra
  vm_nsg1    = var.vm_nsg1 # pass the NSG variable
  vm_sub     = var.vm_sub  # pass the subnet variable
  depends_on = [module.resource_group]
}

# module "subnet" {
#   source     = "../../modules/azurerm_networking"
#   vm_sub     = var.vm_sub
#   depends_on = [module.network]
# }

# module "nsg" {
#   source     = "../../modules/azurerm_networking"
#   vm_nsg     = var.vm_nsg1
#   depends_on = [module.resource_group, module.network, module.subnet,module]
# }

# module "nic" {
#   source     = "../../modules/azurerm_compute"
#   vm_nic     = var.vm_nic
#   depends_on = [module.subnet]
# }

# module "avset" {
#   source     = "../../modules/azurerm_compute"
#   avset      = var.avset
#   depends_on = [module.resource_group]
# }

module "rgvm" {
  source          = "../../modules/azurerm_compute"
  vm              = var.vm
  avset           = var.avset
  vm_nic          = var.vm_nic
  depends_on      = [module.resource_group, module.network]
  public_key_path = "~/.ssh/id_rsa.pub"

}

module "keyvault" {
  source     = "../../modules/azurerm_keyvault"
  vm_kv      = var.vm_kv
  depends_on = [module.resource_group]
}

module "public_ip" {
  source = "../../modules/azurerm_public_ip"
  p_var  = var.p_var
  depends_on = [module.resource_group]
}
