#create storage account for dev activities
resource "azurerm_storage_account" "stg-asda" {
  name                     = "stglog${var.business_unit}${var.environment}${random_string.random.id}"
  resource_group_name      = azurerm_resource_group.rg-asda.name
  location                 = azurerm_resource_group.rg-asda.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  #public_network_access_enabled = true 

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["159.246.20.2","159.246.40.2"]
    virtual_network_subnet_ids = [azurerm_subnet.snet-core.id,azurerm_subnet.snet-privateendpoints.id]
    bypass                     = ["Metrics"]
  }

  /*tags = {
    environment = "staging"
  }*/
}

data "azurerm_storage_account" "data-stg-data" {
  name                = "stglog${var.business_unit}${var.environment}${random_string.random.id}"
  resource_group_name = azurerm_resource_group.rg-asda.name
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "ls-stg" {
  name              = "LS-BLOB-STORAGE"
  data_factory_id   = azurerm_data_factory.adf-asda.id
  //connection_string = data.azurerm_storage_account.data-stg-data.primary_connection_string
}

