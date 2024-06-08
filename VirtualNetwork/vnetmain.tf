variable "vnetmain" {
  
}
resource "azurerm_virtual_network" "vnet" {
  for_each= var.vnetmain
  name                = each.value.vnetname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space 

dynamic "subnet"{
  for_each=each.value.subnets
  content {
    name= subnet.value.name
    address_prefix= subnet.value.address_prefix

  }
}
}
