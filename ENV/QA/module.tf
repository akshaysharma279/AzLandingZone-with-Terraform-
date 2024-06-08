variable "resmain"{}

module "resource"{
    source= "../../Resourcegroup"
    resmain= var.resmain
}
variable "vnetmain" {}

module "vnet"{
source= "../../VirtualNetwork"
vnetmain= var.vnetmain
depends_on = [ var.resmain ]
}