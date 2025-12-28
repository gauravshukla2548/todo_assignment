
# Resource group creation for all three env

rg_details = {

  rg1 = {
    name       = "rg_hike_dev"
    location   = "central India"
    managed_by = "gaurav"
    tags = {
      env = "dev"
  } }

}



# # Networking create for all three env

networks = {
  Vnet1 = {
    name                = "sb_vnet"
    resource_group_name = "rg_hike_dev"
    location            = "central India"
    address_space       = ["10.0.0.0/16"]

  }
}

subnets = {
  subnet1 = {
    name                 = "sb_nike"
    address_prefixes     = ["10.0.1.0/24"]
    virtual_network_name = "sb_vnet"
    resource_group_name  = "rg_hike_dev"
  }
}



pip = {

  pip1 = {

    name                = "pip_nike"
    location            = "central india"
    resource_group_name = "rg_hike_dev"
    allocation_method   = "Static"

  }

  pip2 = {

    name                = "pip_nike-1"
    location            = "central india"
    resource_group_name = "rg_hike_dev"
    allocation_method   = "Static"

  }
}

nic = {
  nic1 = {
    name                = "nic_nike"
    resource_group_name = "rg_hike_dev"
    location            = "central india"

    ip_configuration = {

      ip_configuration1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
        # helper keys to resolve ids in the root module
        subnet_key    = "subnet1"
        public_ip_key = "pip1"

      }

    }
  }

  nic2 = {
    name                = "nic_nike-1"
    resource_group_name = "rg_hike_dev"
    location            = "central india"

    ip_configuration = {

      ip_configuration1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
        # helper keys to resolve ids in the root module
        subnet_key    = "subnet1"
        public_ip_key = "pip2"

      }

    }
  }
}


vms = {
  vm1 = {
    name                            = "vne"
    resource_group_name             = "rg_hike"
    resource_group_name             = "rg_hike_dev"
    location                        = "central india"
    size                            = "standard_b16als_v2"
    admin_username                  = "adminuser"
    admin_password                  = "Ericsson@143"
    disable_password_authentication = false
    network_interface_id            = "nic1" # This will be replaced in main.tf

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }

   vm2 = {
    name                            = "vne-1"
    resource_group_name             = "rg_hike"
    resource_group_name             = "rg_hike_dev"
    location                        = "central india"
    size                            = "standard_b16als_v2"
    admin_username                  = "adminuser"
    admin_password                  = "Ericsson@143"
    disable_password_authentication = false
    network_interface_id            = "nic2" # This will be replaced in main.tf

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }
}

#ACR Value 

acrs = {
  acr-1 = {
    name                = "hikeacr123876"
    resource_group_name = "rg_hike_dev"
    location            = "central india"
    sku                 = "Standard"
  }
}


datas = {
  datas-1 = {
    name                = "hike-database"
    resource_group_name = "rg_hike_dev"
    location            = "central india"
    server_name         = "hike-server"
    tags = {
      evn = "prod"

    }
  }

}


sqlser = {
  sqlser-1 = {
    name                         = "hike-server"
    resource_group_name          = "rg_hike_dev"
    location                     = "central india"
    version                      = "12.0"
    administrator_login          = "devopsuseradmin"
    administrator_login_password = "pass@143"
  }

}



# KVS and AKS


kvs = {
  kvs-1 = {
    name                        = "hike-kvs"
    resource_group_name         = "rg_hike_dev"
    location                    = "central india"
    enabled_for_disk_encryption = false

    soft_delete_retention_days = 7
    purge_protection_enabled   = true
    sku_name                   = "standard"

  }

}

aks = {
  aks-1 = {
    name                = "hike-aks"
    resource_group_name = "rg_hike_dev"
    location            = "central india"
    dns_prefix          = "my-aks"

    default_node_pool = {
      dnp-1 = {
        name       = "default"
        node_count = 1
        vm_size    = "standard_b16als_v2"

      }

    }

  }

}
