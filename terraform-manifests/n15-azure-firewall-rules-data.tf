resource "azurerm_firewall_policy_rule_collection_group" "fw-rcgs-data" {
  name               = "rcg-${var.business_unit}-${var.environment}"
  firewall_policy_id = module.asda_azlz_shared_services.output_azure_fw_policy_id
  priority           = 5000
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
        //source_addresses  = azurerm_subnet.snet-core.address_prefixes
        source_ip_groups = [azurerm_ip_group.ipg-data.id]
      }
  }

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
  }

  /*nat_rule_collection {
    name     = "nat_rule_collection1"
    priority = 300
    action   = "Dnat"
    rule {
      name                = "nat_rule_collection1_rule1"
      protocols           = ["TCP", "UDP"]
      source_addresses    = ["10.0.0.1", "10.0.0.2"]
      destination_address = "192.168.1.1"
      destination_ports   = ["80"]
      translated_address  = "192.168.0.1"
      translated_port     = "8080"
    }
  }*/

  //depends_on = [ azurerm_firewall_policy_rule_collection_group.azurerm_firewall_policy_rule_collection_group.fw-rcgs-shared ]
}