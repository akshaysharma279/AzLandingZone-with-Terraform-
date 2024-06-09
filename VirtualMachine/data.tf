data "azurerm_subnet" "subnet" {
    
  name                 = "AzureBastionSubnet"
  virtual_network_name = "akkivnet"
  resource_group_name  = "akkires"
}
data "azurerm_key_vault" "username" {
  name                = "username"
  resource_group_name = "akkires"
}
data "azurerm_key_vault" "password" {
  name                = "password"
  resource_group_name = "akkires"
}