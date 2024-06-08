 resmain ={
    res={
       resname     = "akkires"
  location = "canadaeast"
    }
 }
    vnetmain={
      vnet={
    vnetname                ="akkivnet"
  location            = "canadaeast"
  resource_group_name = "akkires"
  address_space       = ["10.0.0.0/16"]
  subnets={
    sub={
      name= "akkisubnet"
      address_prefix= "10.0.1.0/24"
    }
    sub1={
      name= "AzureBastionSubnet"
      address_prefix= "10.0.2.0/24"
    }
  }
}
    }
    
 

