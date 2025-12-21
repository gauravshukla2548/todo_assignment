resource "azurerm_public_ip" "pip_nike" {
  for_each = var.pip

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method

}


output "public_ip_ids" {
  value = {
    for k, pip in azurerm_public_ip.pip_nike : k => pip.id
  }
}

