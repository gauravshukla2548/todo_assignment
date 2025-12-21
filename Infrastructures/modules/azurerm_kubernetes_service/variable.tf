variable "aks" {
  type=map(object({
     name                = string
  location            = string
  resource_group_name = string
  dns_prefix          = string

  default_node_pool=map(object({
   name       = string
      node_count = string
      vm_size    = string
  }))
      
  }))



  
}
