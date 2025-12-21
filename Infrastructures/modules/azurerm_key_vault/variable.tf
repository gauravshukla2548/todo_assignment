variable "kvs" {
   type= map(object({
    name                      = string
  location                    = string
  resource_group_name         = string
  enabled_for_disk_encryption = string
 
  soft_delete_retention_days  =string
  purge_protection_enabled    =string
  sku_name                    =string
  
   }))
  
}