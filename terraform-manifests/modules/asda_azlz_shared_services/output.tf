#id of the firewall public ip address
output "output_firewall_ip_address" {
  value = azurerm_public_ip.pip-firewall.id
}

#id of the shared services vnet
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
output "output_rg-asda-shared" {
  value = azurerm_resource_group.rg-asda-shared.name
}

#IP address of the azure firewall
output "output_pip_azurefirewall" {
  description = "Public ip address of the Azure firewall."
  value = azurerm_public_ip.pip-firewall.ip_address
}

#Azure firewall policy id
output "output_azure_fw_policy_id" {
  description = "public id of the azure polic id."
  value = azurerm_firewall_policy.fwpolicy-shared.id
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






