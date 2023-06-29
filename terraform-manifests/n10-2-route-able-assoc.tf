  #route table association to subnet
  resource "azurerm_subnet_route_table_association" "rt_assoc_shared" {
    count = var.var_firewall_data == "YES" ? 1 : 0
    //subnet_id      = azurerm_subnet.snet-core-shared.id
    subnet_id = module.asda_azlz_shared_services.output_shared_core_subnet_id
    //route_table_id = azurerm_route_table.rt-shared-asda[count.index].id
    route_table_id = azurerm_route_table.rt-shared-asda[count.index].id
  }
