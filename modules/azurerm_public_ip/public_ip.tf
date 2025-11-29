# resource "azurerm_public_ip_prefix" "ip_prefix" {
#   for_each            = var.p_var
#   name                = each.value.ip_name
#   resource_group_name = each.value.rg_name
#   location            = each.value.rg_location
#   # prefix_length       = each.value.ip_prefix_length
#   sku                 = each.value.sku_name
# }

# resource "azurerm_public_ip" "pip" {
#   for_each            = var.p_var
#   name                = each.value.ip_name
#   resource_group_name = each.value.rg_name
#   location            = each.value.rg_location
#   allocation_method   = each.value.allocation_method
#   sku                 = "Standard"
#   domain_name_label   = each.value.domain_name_label
#   public_ip_prefix_id = azurerm_public_ip_prefix.ip_prefix[each.key].id

#   tags = each.value.tags
# }

resource "azurerm_public_ip" "pip" {
  for_each            = var.p_var
  name                = each.value.ip_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku_name
  domain_name_label   = each.value.domain_name_label

  tags = each.value.tags
}
