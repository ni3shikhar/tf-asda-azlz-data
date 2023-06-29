resource "azurerm_firewall_policy_rule_collection_group" "fw-rcgs-data" {
  count = var.var_firewall_data == "YES" ? 1 : 0
  name               = "rcg-${var.business_unit}-${var.environment}"
  firewall_policy_id = "${module.asda_azlz_shared_services.output_azure_fw_policy_id[count.index]}"
  priority           = 5000
  application_rule_collection {
      name     = "rc-${var.business_unit}-${var.environment}-application"
      priority = 3000
      action   = "Allow"
      rule {
        name = "allow-coredatasubnet-to-azure"
        description = "allow access to internet to required service tags."
        destination_fqdn_tags = ["AzureBackup","MicrosoftActiveProtectionService","WindowsDiagnostics","WindowsUpdate"]
        protocols {
          type = "Http"
          port = 80
        }
        protocols {
          type = "Https"
          port = 443
        }
        source_ip_groups = [azurerm_ip_group.ipg-data.id]
      }
      rule {
      name = "allow-coresharedsubnet-to-azure"
      description = "allow access to internet to required service tags."
      destination_fqdn_tags = ["AzureBackup","MicrosoftActiveProtectionService","WindowsDiagnostics","WindowsUpdate"]
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_ip_groups = [module.asda_azlz_shared_services.output_ip_group_id_shared]
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
        rule{
          name                  = "allow-shared-to-${var.environment}"
          protocols             = ["TCP","UDP"]
          source_addresses    = module.asda_azlz_shared_services.output_vnet_cidr
          destination_addresses = azurerm_virtual_network.vnet-asda.address_space
          destination_ports     = ["*"]
        }

    }
}