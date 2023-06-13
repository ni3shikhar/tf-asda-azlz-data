#create shir VM
resource "azurerm_network_interface" "nic-shir" {
  name                = "nic-vm${var.business_unit}${var.environment}shir"
  location            = azurerm_resource_group.rg-asda.location
  resource_group_name = azurerm_resource_group.rg-asda.name

  ip_configuration {
    name                          = "configuration1"
    subnet_id                     = azurerm_subnet.snet-core.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm-data-shir" {
  name                  = "vm${var.business_unit}${var.environment}shir"
  location              = azurerm_resource_group.rg-asda.location
  resource_group_name   = azurerm_resource_group.rg-asda.name
  network_interface_ids = [azurerm_network_interface.nic-shir.id]
  size               = "Standard_B4ms"
  admin_username = "adminshir"
  admin_password = var.pwd_shir
  patch_mode = "AutomaticByPlatform"
  
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  /*tags = {
    environment = "staging"
  }*/
}