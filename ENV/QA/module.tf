variable "resmain" {}

module "resource" {
  source  = "../../Resourcegroup"
  resmain = var.resmain
}
variable "vnetmain" {}

module "vnet" {
  source     = "../../VirtualNetwork"
  vnetmain   = var.vnetmain
  depends_on = [module.resource]
}

variable "vmnic" {}

module "vm" {
  source     = "../../VirtualMachine"
  vmnic      = var.vmnic
  depends_on = [module.key]

}
variable "keyvault" {}
module "key" {
  source     = "../../keyvault"
  keyvault   = var.keyvault
  depends_on = [module.vnet]
}



