variable "rg_details" {
  description = "nike ki vm"
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string, "gaurav")
    tags       = optional(map(string), { "env" = "dev" })

  }))

}



variable "networks" {
  description = "network banna hai"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)

  }))
}



variable "nic" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string

    ip_configuration = map(object({
      name                 = string
      subnet_id            = optional(string)
      public_ip_address_id = optional(string)
      # helper keys to resolve ids from other module outputs when subnet_id/public_ip are not provided
      vnet_key                      = optional(string)
      subnet_index                  = optional(number)
      public_ip_key                 = optional(string)
      private_ip_address_allocation = string
    }))
  }))
}



variable "pip" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string

  }))

}






variable "vms" {
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    network_interface_id            = string

    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}



variable "subnets" {

  type = map(object({
    name = string

    virtual_network_name = string
    resource_group_name  = string
    address_prefixes     = list(string)

  }))

}



variable "acrs" {

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
  }))



}

variable "datas" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    server_name         = string
    tags                = map(string)
  }))

}
variable "sqlser" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
  }))

}


variable "kvs" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = string

    soft_delete_retention_days = string
    purge_protection_enabled   = string
    sku_name                   = string

  }))

}


variable "aks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string

    default_node_pool = map(object({
      name       = string
      node_count = string
      vm_size    = string
    }))

  }))




}


