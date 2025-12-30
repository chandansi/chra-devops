resource "azurerm_mssql_server" "vm_sqlserver" {
  for_each = var.vm_ser
  name                         = each.value.server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.rg_location
  version                      = each.value.version
  minimum_tls_version          = each.value.minimum_tls_version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}