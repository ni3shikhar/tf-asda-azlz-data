  #route table association to subnet
  
  resource "azurerm_subnet_route_table_association" "rt_assoc_spoke" {
    count = var.var_firewall_data == "YES" ? 1 : 0
    subnet_id      = azurerm_subnet.snet-core.id
    route_table_id = azurerm_route_table.rt-spoke-asda[count.index].id
  }

  resource "azurerm_subnet_route_table_association" "rt_assoc_spoke_pe" {
    count = var.var_firewall_data == "YES" ? 1 : 0
    subnet_id      = azurerm_subnet.snet-privateendpoints.id
    route_table_id = azurerm_route_table.rt-spoke-asda[count.index].id
  }
  