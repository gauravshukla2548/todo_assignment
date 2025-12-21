resource "azurerm_kubernetes_cluster" "myaks" {
  for_each = var.aks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

   identity {
  
    type = "SystemAssigned"
  }


  dynamic "default_node_pool" {
    for_each = each.value.default_node_pool

    content {
      name       = default_node_pool.value.name
      node_count = default_node_pool.value.node_count
      vm_size    = default_node_pool.value.vm_size
    }
  }
}



