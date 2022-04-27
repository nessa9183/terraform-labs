module "resource_group" {
  source     = "./modules/resource_group"
  linux_rg   = "Linux_RG"
  windows_rg = "Windows_RG"
  network_rg = "Network_RG"
  location   = "Canada East"
}


module "network" {
  source          = "./modules/network"
  resource_group  = module.resource_group.network_rg
  location        = "Canada East"
  vnet            = "lab05s2-vnet"
  vnet_addr_space = ["10.0.0.0/16"]
  subnet          = "lab05s2-subnet1"
  subnet2         = "lab05s2-subnet2"
  subnet_space    = ["10.0.1.0/24"]
  subnet_space2   = ["10.0.2.0/24"]
  nsg             = "lab05s2-nsg"
  nsg2            = "lab05s2-nsg2"
}

module "linux" {
  source             = "./modules/linux"
  resource_group     = module.resource_group.linux_rg
  linux_avs          = "linux_avs"
  nb_count           = 2
  location           = "Canada East"
  linux_name         = "lab05s2-db1-u"
  vm_size            = "Standard_B1s"
  subnet_id          = module.network.subnet_id
  subnet_association = module.network.subnet_association
}

module "windows" {
  source         = "./modules/windows"
  windows_avs    = "windows_avs"
  resource_group = module.resource_group.windows_rg
  windows_name = {
    lab-web-w-vm1 = "Standard_B1s"
  }
  location            = "Canada East"
  subnet2_id          = module.network.subnet2_id
  subnet_association2 = module.network.subnet_association2
}