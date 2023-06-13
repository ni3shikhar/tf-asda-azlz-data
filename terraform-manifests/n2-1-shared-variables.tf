module "asda_azlz_shared_services" {
  source = "./modules/asda_azlz_shared_services"
  //source = "ni3shikhar/crw-d365/azurerm"
  //version = "5.0.0"
  
 
  business_unit = "slft"
  environment = "shared"
  resoure_group_location = "eastus"
  vnet_address_space_asda_shared = [ "10.0.0.0/24" ]
  var_bastion = "YES"
  bastion_subent_address_prefix = [ "10.0.0.128/26" ]
  var_firewall = "NO"
  firewall_subent_address_prefix = [ "10.0.0.64/26" ]
  var_gateway = "NO"
  gateway_subent_address_prefix = [ "10.0.0.0/27" ]
  core_subent_address_prefix = [ "10.0.0.192/27"]

}