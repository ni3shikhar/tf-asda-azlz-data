#network peering between share services vnet and spoke/data vnet
resource "azurerm_virtual_network_peering" "spoke-to-shared" {
  name                      = "peering-${var.environment}-to-shared"
  resource_group_name       = azurerm_resource_group.rg-asda.name
  virtual_network_name      = azurerm_virtual_network.vnet-asda.name
  remote_virtual_network_id = module.asda_azlz_shared_services.output_vnet-asda-shared_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false  
}

resource "azurerm_virtual_network_peering" "shared-to-spoke" {
  name                      = "peering-shared-to-${var.environment}"
  resource_group_name       = module.asda_azlz_shared_services.rg-asda-shared-name
  virtual_network_name      = module.asda_azlz_shared_services.output_vnet-asda-shared_name
  remote_virtual_network_id = azurerm_virtual_network.vnet-asda.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false 
    
  depends_on = [ 
    azurerm_virtual_network.vnet-asda
   ]
}