variable "nic" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string

    ip_configuration = map(object({
      name                          = string
      subnet_id                     = optional(string)
      public_ip_address_id        = optional(string)
      # helper keys to resolve ids from other module outputs when subnet_id/public_ip are not provided
      vnet_key                      = optional(string)
      subnet_index                  = optional(number)
      public_ip_key                 = optional(string)
      private_ip_address_allocation = string
    }))
  }))
}