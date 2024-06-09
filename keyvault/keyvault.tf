variable "keyvault"{}

resource "azurerm_key_vault" "key" {
    for_each = var.keyvault

  name                        = each.value.keyname
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name 
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azuread_user.objectname.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}



resource "random_password" "password" {
  length           = 20
  special          = true
  override_special = "!@#$%&*()-_=+[]{}|;:/?,.<>"
}

resource "azurerm_key_vault_secret" "username" {
    for_each = var.keyvault
  name         = "username"
  value        = "akkiname"
  key_vault_id = azurerm_key_vault.key[each.key].id
  depends_on = [ azurerm_key_vault.key ]
}

resource "azurerm_key_vault_secret" "password" {
    for_each = var.keyvault
  name         = "password"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.key[each.key].id
  depends_on = [ azurerm_key_vault.key ]
}

