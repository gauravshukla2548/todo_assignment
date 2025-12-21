resource "azurerm_storage_account" "example" {

  for_each = var.sts
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.storage_account_type
  tags = each.value.tags

}


