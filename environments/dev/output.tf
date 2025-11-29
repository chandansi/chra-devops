# Public IP Outputs
output "public_ip_addresses" {
  value       = try(module.public_ip.public_ip_addresses, {})
  description = "All public IP addresses"
}

output "public_ip_ids" {
  value       = try(module.public_ip.public_ip_ids, {})
  description = "All public IP IDs"
}

# Key Vault Outputs
output "key_vault_id" {
  value       = try(module.keyvault.key_vault_id, "")
  description = "The Key Vault ID"
}

output "key_vault_uri" {
  value       = try(module.keyvault.key_vault_uri, "")
  description = "The Key Vault URI"
}

# Resource Group Outputs
output "resource_group_name" {
  value       = try(module.resource_group.resource_group_name, "")
  description = "The Resource Group Name"
}

# VM Outputs
output "vm_ids" {
  value       = try(module.rgvm.vm_ids, {})
  description = "The VM IDs"
}

output "availability_set_id" {
  value       = try(module.rgvm.availability_set_id, "")
  description = "The Availability Set ID"
}