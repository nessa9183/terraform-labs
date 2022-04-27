module "rgroup" {
  source              = "./modules/rgroup"
  resource_group_name = "assignment1-RG-0171"
  location            = "Central US"
  common_tags         = local.common_tags
}

module "network" {
  source              = "./modules/network"
  resource_group_name = module.rgroup.resource_group_name_output
  location            = module.rgroup.location_output
  common_tags         = local.common_tags
  vnet_name           = "vnet-0171"
  vnet_addr_space     = ["10.0.0.0/16"]
  subnet_name         = "subnet-0171"
  sub_addr_space      = ["10.0.1.0/24"]
  depends_on          = [module.rgroup]
}

module "common" {
  source                       = "./modules/common"
  resource_group_name          = module.rgroup.resource_group_name_output
  location                     = module.rgroup.location_output
  common_tags                  = local.common_tags
  log_analytics_workspace_name = "log-analytics-workspace-0171"
  recovery_vault = {
    name              = "recovery-service-vault-0171"
    sku               = "Standard"
    storage_mode_type = "LocallyRedundant"
  }
  storage_account_name = "storageaccount0171"
  depends_on           = [module.rgroup]
}


module "vmlinux" {
  source              = "./modules/vmlinux"
  resource_group_name = module.rgroup.resource_group_name_output
  location            = module.rgroup.location_output
  common_tags         = local.common_tags
  linux_avs_name      = "linux-AVS-0171"
  count_val           = 2
  vm = {
    name = "linux0171"
    size = "Standard_B1s"
  }
  subnet_id                         = module.network.subnet_id_output
  boot_diagnostics_storage_endpoint = module.common.storage_account_blob_endpoint_output
  depends_on = [
    module.common,
    module.network
  ]
}

module "vmwindows" {
  source              = "./modules/vmwindows"
  resource_group_name = module.rgroup.resource_group_name_output
  location            = module.rgroup.location_output
  common_tags         = local.common_tags
  windows_avs_name    = "Windows-AVS-0171"
  vm = {
    name = "window0171"
    size = "Standard_B1s"
  }
  subnet_id                         = module.network.subnet_id_output
  boot_diagnostics_storage_endpoint = module.common.storage_account_blob_endpoint_output
  depends_on = [
    module.common,
    module.network
  ]
}

module "datadisk" {
  source              = "./modules/datadisk"
  resource_group_name = module.rgroup.resource_group_name_output
  location            = module.rgroup.location_output
  common_tags         = local.common_tags
  disk_count          = 3
  data_disk_name      = "data-disk-0171"
  data_disk_prop = {
    storage_account_type = "Standard_LRS"
    create_option        = "Empty"
    disk_size_gb         = "10"
  }
  linux_vm_ids  = module.vmlinux.vm_ids_output
  windows_vm_id = module.vmwindows.vm_id_output
  depends_on = [
    module.vmlinux,
    module.vmwindows
  ]
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  resource_group_name = module.rgroup.resource_group_name_output
  location            = module.rgroup.location_output
  common_tags         = local.common_tags
  load_balancer_name  = "load-balancer-0171"
  linux_vm_nics       = module.vmlinux.vm_nics_output
  depends_on          = [module.vmlinux]
}

module "database" {
  source              = "./modules/database"
  resource_group_name = module.rgroup.resource_group_name_output
  location            = module.rgroup.location_output
  common_tags         = local.common_tags
  name                = "postgres-0171"
  server_sku_name     = "B_Gen5_1"
}
