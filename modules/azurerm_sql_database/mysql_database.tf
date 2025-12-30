data "azurerm_mssql_server" "lookup" {
  for_each            = var.vmdb
  name                = each.value.server_name
  resource_group_name = each.value.server_resource_group
}

resource "azurerm_mssql_database" "vm_db" {
  for_each      = var.vmdb
  name          = each.value.database_name
  server_id     = data.azurerm_mssql_server.lookup[each.key].id
  collation     = each.value.collation
  license_type  = each.value.license_type
  max_size_gb   = each.value.max_size_gb
  sku_name      = each.value.sku_name
  enclave_type  = each.value.enclave_type
  tags          = each.value.tags

  lifecycle {
    prevent_destroy = true
  }
}