#create rule colleciton groups
/*resource "azurerm_firewall_policy_rule_collection_group" "fw-rcgs-data" {
  name               = "rcg-${var.business_unit}-${var.environment}"
  firewall_policy_id = module.asda_azlz_shared_services.output_azure_fw_policy_id
  priority           = 5000
  
   network_rule_collection {
    name     = "rc-${var.business_unit}-${var.environment}-network"
    priority = 5000
    action   = "Allow"
    rule {
      name                  = "allow-${var.environment}-to-shared"
      protocols             = ["TCP","UDP"]
      source_addresses      = azurerm_virtual_network.vnet-asda.address_space
      destination_addresses = module.asda_azlz_shared_services.output_vnet_cidr
      destination_ports     = ["*"]
    }

    rule{
      name                  = "allow-shared-to-${var.environment}"
      protocols             = ["TCP","UDP"]
      source_addresses      = module.asda_azlz_shared_services.output_vnet_cidr
      destination_addresses = azurerm_virtual_network.vnet-asda.address_space
      destination_ports     = ["*"]
    }
    }

  application_rule_collection {
    name     = "rc-${var.business_unit}-${var.environment}-application"
    priority = 3000
    action   = "Allow"
    rule {
      name = "allow-coredatasubnet-to-azure"
      description = "allow access to internet to required service tags."
      //fqdn_tags = ["AzureBackup","MicrosoftActiveProtectionService","WindowsDiagnostics","WindowsUpdate"]
      destination_fqdn_tags = ["AzureBackup","MicrosoftActiveProtectionService","WindowsDiagnostics","WindowsUpdate"]
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses  = azurerm_subnet.snet-core.address_prefixes
    }
    rule {
      name = "allow-coresharedsubnet-to-azure"
      description = "allow access to internet to required service tags."
      //fqdn_tags = ["AzureBackup","MicrosoftActiveProtectionService","WindowsDiagnostics","WindowsUpdate"]
      destination_fqdn_tags = ["AzureBackup","MicrosoftActiveProtectionService","WindowsDiagnostics","WindowsUpdate"]
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses  = module.asda_azlz_shared_services.output_addr_prefix_snet_core_shared
    }
    
  }
}*/