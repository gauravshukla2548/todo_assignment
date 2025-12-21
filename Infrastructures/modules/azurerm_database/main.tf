variable "sql_server_id" {
  type = string
}

resource "azurerm_mssql_database" "Database" {
  for_each            = var.datas
  name         = "example-db"
  server_id = var.sql_server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
}





