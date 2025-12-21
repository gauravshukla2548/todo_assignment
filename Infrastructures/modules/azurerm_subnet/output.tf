output "subnet_ids" {
  value = {
    for k, s in azurerm_subnet.sub : k => s.id
  }
}