variable "datas" {
  type = map(object({
  name                = string
  resource_group_name = string
  location            = string
  server_name         = string
  tags                = map(string)
  }))
  
}