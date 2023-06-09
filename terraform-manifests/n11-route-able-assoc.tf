  #route table association to subnet
  resource "azurerm_subnet_route_table_association" "rt_assoc_spoke" {
  subnet_id      = azurerm_subnet.snet-core.id
  route_table_id = azurerm_route_table.rt-spoke-asda.id
  }