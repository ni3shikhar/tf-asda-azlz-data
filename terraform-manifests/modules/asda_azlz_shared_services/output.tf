#id of the shared services vnet
output "output_shared_core_subnet_id" {
  value = azurerm_subnet.snet-core-shared.id
}

#id of the shared services core subnet
output "output_vnet-asda-shared_id" {
  value = azurerm_virtual_network.vnet-asda-shared.id
}

#shared services vnet name
output "output_vnet-asda-shared_name" {
  value = azurerm_virtual_network.vnet-asda-shared.name
}

#address_space/cidr of the shared service virtual network
output "output_vnet_cidr" {
  value = azurerm_virtual_network.vnet-asda-shared.address_space
}

#resource group name of the shared environment
output "rg-asda-shared-name" {
  value = azurerm_resource_group.rg-asda-shared.name
}


#Azure firewall policy id
output "output_azure_fw_policy_id" {
  description = "public id of the azure polic id."
  //value = azurerm_firewall_policy.fwpolicy-shared.id
  //value = var.var_firewall == "YES" ? azurerm_firewall_policy.fwpolicy-shared[0].id : 0
  value = "${azurerm_firewall_policy.fwpolicy-shared.*.id}"
}

#address prefixes of the core subnet of shared services vnet
output "output_addr_prefix_snet_core_shared" {
  value = azurerm_subnet.snet-core-shared.address_prefixes
}

#ip group of the shared services core subnet
output "output_ip_group_cidrs_shared" {
  value = azurerm_ip_group.ipg-shared.cidrs
}

#ID of the ip group - shared
output "output_ip_group_id_shared" {
  value = azurerm_ip_group.ipg-shared.id
}

output "firewall_id" {
  description = "Firewall generated id"
  value       = azurerm_firewall.fw-shared[*].id
}

output "firewall_name" {
  description = "Firewall name"
  value       = azurerm_firewall.fw-shared[*].name
}

output "subnet_id" {
  description = "ID of the subnet attached to the firewall"
  value       = azurerm_firewall.fw-shared[*].ip_configuration[0].subnet_id
}

output "private_ip_address" {
  description = "Firewall private IP"
  value       = azurerm_firewall.fw-shared[*].ip_configuration[0].private_ip_address
}

output "public_ip_address" {
  description = "Firewall public IP"
  value       = azurerm_public_ip.pip-firewall[*].ip_address
}








