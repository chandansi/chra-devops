
module "resource_group" {
    source = "../../modules_vvm/azurerm_resource_group"
   
    
    vm_rgss = var.vm_rgss

  
}