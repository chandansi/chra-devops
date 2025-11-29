output "key_vault_id" {
  value       = azurerm_key_vault.vm_kvault["vm_kv01"].id
  description = "The Key Vault ID"
}

output "key_vault_uri" {
  value       = azurerm_key_vault.vm_kvault["vm_kv01"].vault_uri
  description = "The Key Vault URI"
}