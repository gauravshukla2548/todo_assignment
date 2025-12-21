variable "rg_details" {
  description = "nike ki vm"
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string, "gaurav")
    tags       = optional(map (string) ,{"env" = "dev"})

  }))

}