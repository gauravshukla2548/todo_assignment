resource "azurerm_mssql_server" "sqlser" {
  for_each                     = var.sqlser
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}


output "sqlser_out" {
  value = {for k, ser in azurerm_mssql_server.sqlser:k=>ser.id}
}
