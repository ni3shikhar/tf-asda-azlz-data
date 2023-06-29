#create data environment ip group
resource "azurerm_ip_group" "ipg-data" {
  name                = "ipg-data"
  location            = azurerm_resource_group.rg-asda.location
  resource_group_name = azurerm_resource_group.rg-asda.name

  cidrs = var.asda_subent_address_prefix

  //depends_on = [  ]

  /*tags = {
    environment = "Production"
  }*/
}