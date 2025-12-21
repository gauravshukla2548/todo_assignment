resource "azurerm_network_interface" "nic_nike" {
  for_each            = var.nic
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {

    name                          = ip_configuration.value.name
    subnet_id                     = ip_configuration.value.subnet_id
    public_ip_address_id          = ip_configuration.value.public_ip_address_id
    private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation

    }

  }
}



output "network_interface_ids" {
  value = {
    for k, nic in azurerm_network_interface.nic_nike : k => nic.id
  }
}


