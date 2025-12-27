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
  
  depends_on = [module.resource_group]
}


module "subnet" {
  source     = "../../modules/azurerm_subnet"
  vm_sub     = var.vm_sub
  depends_on = [module.network]
}

module "nsg" {
  source     = "../../modules/azurerm_nsg"
  vm_nsg1     = var.vm_nsg1
  depends_on = [module.subnet]
}



# module "avset" {
#   source     = "../../modules/azurerm_compute"
#   avset      = var.avset
#   depends_on = [module.resource_group]
# }

module "rgvm" {
  source          = "../../modules/azurerm_compute"
  vm              = var.vm
  avset           = var.avset
  public_key_path = "~/.ssh/id_rsa.pub"
  depends_on      = [module.nic]

}

module "nic" {
  source     = "../../modules/azurerm_nic"
  vm_nic     = var.vm_nic
  depends_on = [module.subnet, module.nsg]
}

module "keyvault" {
  source     = "../../modules/azurerm_keyvault"
  vm_kv      = var.vm_kv
  depends_on = [module.resource_group]
}

module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  p_var      = var.p_var
  depends_on = [module.resource_group]
}
