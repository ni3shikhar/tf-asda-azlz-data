#route table and routes
resource "azurerm_route_table" "rt-shared-asda" {
  count = var.var_firewall_data == "YES" ? 1 : 0
  name                          = "route-${var.business_unit}-${var.environment}-001"
  location                      = var.resoure_group_location //change it to output variable of shared service module
  resource_group_name           = module.asda_azlz_shared_services.output_rg-asda-shared
  disable_bgp_route_propagation = false

  route {
    name           = "route-to-internet"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = "${module.asda_azlz_shared_services.output_privateip_azurefirewall}"
    //next_hop_in_ip_address = "${azurerm_firewall.fw-shared[1].private_ip_address}"
  }
  route {
    name           = "RFC_1918_10"
    address_prefix = "10.0.0.0/8"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = module.asda_azlz_shared_services.output_privateip_azurefirewall
  }
  route {
    name           = "RFC_1918_172"
    address_prefix = "172.16.0.0/12"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = module.asda_azlz_shared_services.output_privateip_azurefirewall
  }
  route {
    name           = "RFC_1918_192"
    address_prefix = "192.168.0.0/16"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = module.asda_azlz_shared_services.output_privateip_azurefirewall
  }

  /*tags = {
    environment = "Production"
  }*/
}