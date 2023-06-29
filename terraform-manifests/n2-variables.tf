# Input Variables

# 1. Business Unit Name
variable "business_unit" {
  description = "Business Unit Name"
  type = string
  default = "slft"
}
# 2. Environment Name
variable "environment" {
  description = "Environment Name"
  type = string
  default = "dev"
}

# 4. Resource Group Location
variable "resoure_group_location" {
  description = "Resource Group Location"
  type = string
  default = "eastus"
}

# 6. Virtual Network Address - Dev
variable "vnet_address_space_asda" {
  description = "Virtual Network Address Space for Dev Environment"
  type = list(string)
  default = [ "10.1.0.0/16" ]
}

# 13. core subnet
variable "asda_subent_address_prefix" {
  description = "D365 subnet address prefix"
  type = list(string)
  default = [ "10.1.1.0/24" ]
}

# 13. Privateendpoint core subnet
variable "pe_subent_address_prefix" {
  description = "D365 subnet address prefix"
  type = list(string)
  default = [ "10.1.2.0/24" ]
}

#Azure MS SQL Azure Admin Username
variable "name_azure_sql_server_admin" {
  description = "Username of the MS SQL Server Administrator"
  type = string
  //default = "nitin.shikhare@kadamorg.onmicrosoft.com" //pass this as inline parameter while deployment
  default = "nitin.shikhare@shikhareorg.onmicrosoft.com"
}

#Azure MS SQL Azure Admin Object ID
variable "id_azure_sql_server_admin" {
  description = "Object ID of the MS SQL Server Administrator"
  type = string
  //default = "db2f7ba0-dca2-48b1-8083-374f235d1e10" //pass this as inline parameter while deployment
  default = "9d78b34f-d75a-4468-95ba-1d76fa0446a6" //shikhareorg
}

#Azure Analysis Service Server Adminstrators
variable "aas_admins" {
  description = "Azure Analysis Service Server Adminstrators"
  type = list(string)
  //default = [ "nitin.shikhare@kadamorg.onmicrosoft.com" ] #define this as a sensitive variable.
  default = [ "nitin.shikhare@shikhareorg.onmicrosoft.com" ] #define this as a sensitive variable.
}

#SHIR VM password
variable "pwd_shir" {
  description = "SHIR VM password"
  type = string
  sensitive = true
  default = "P@ssw0rd1234"
}

#Azure firewall flag
variable "var_firewall_data" {
  description = "firewall flag"
  type = string
  default = "NO"
}