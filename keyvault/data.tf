data "azurerm_client_config" "current" {
}
data "azuread_user" "objectname" {
  user_principal_name = "akshay@snehart1126gmail.onmicrosoft.com"
}

