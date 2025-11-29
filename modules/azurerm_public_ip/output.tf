output "public_ip_ids" {
  value       = { for key, pip in azurerm_public_ip.pip : key => pip.id }
  description = "The IDs of the created public IPs"
}

output "public_ip_addresses" {
  value       = { for key, pip in azurerm_public_ip.pip : key => pip.ip_address }
  description = "The IP addresses"
}