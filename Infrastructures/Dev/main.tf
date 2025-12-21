module "rg_nike" {
  source     = "../../modules/azurerm_resource_group"
  rg_details = var.rg_details

}


module "networks" {
  depends_on = [module.rg_nike]
  source     = "../../modules/azurerm_virtual_network"
  networks   = var.networks
}



module "pip" {
  source = "../../modules/azurerm_public_ip"
  pip    = var.pip
}

module "subnet_p" {
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.networks]
}

module "nic" {
  source = "../../modules/azurerm_network_interface"
  nic = {
    for nic_key, nic_val in var.nic : nic_key => merge(nic_val, {
      ip_configuration = {
        for ip_key, ip_val in nic_val.ip_configuration : ip_key => merge(ip_val, {
          subnet_id = lookup(ip_val, "subnet_id", null) != null ? ip_val.subnet_id : (
            lookup(ip_val, "subnet_key", null) != null ? module.subnet_p.subnet_ids[ip_val.subnet_key] : element(values(module.subnet_p.subnet_ids), 0)
          )
          public_ip_address_id = lookup(ip_val, "public_ip_address_id", null) != null ? ip_val.public_ip_address_id : module.pip.public_ip_ids[ip_val.public_ip_key]
        })
      }
    })
  }
}


module "vm" {
  source = "../../modules/azurerm_virtual_machine"
  vms = {
    for k, v in var.vms : k => merge(v, {
      network_interface_id = module.nic.network_interface_ids[v.network_interface_id]
    })
  }
  depends_on = [module.nic, module.pip,module.rg_nike]
   
}


module "hike_acr" {
  source     = "../../modules/azurerm_container_registory "
  acrs       = var.acrs
  depends_on = [module.rg_nike]


}

module "hike_database" {
  source     = "../../modules/azurerm_database"
  datas      = var.datas
  depends_on = [module.rg_nike, module.hike_dataser]

  sql_server_id = values(module.hike_dataser.sqlser_out)[0]
}

module "hike_dataser" {
  source     = "../../modules/azurerm_database_server "
  sqlser     = var.sqlser
  depends_on = [module.rg_nike]

}



module "hike_key_vault" {
  source     = "../../modules/azurerm_key_vault "
  kvs        = var.kvs
  depends_on = [module.rg_nike]

}



module "hike_aks" {
  source = "../../modules/azurerm_kubernetes_service "
  aks    = var.aks

  depends_on = [module.rg_nike]

}









