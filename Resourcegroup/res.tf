variable "resmain"{}

resource "azurerm_resource_group" "res" {
    for_each = var.resmain
  name     = each.value.resname
  location = each.value.location 
}