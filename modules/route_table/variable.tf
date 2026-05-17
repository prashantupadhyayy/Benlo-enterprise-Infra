variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "subnet_ids" {
  type = map(string)
}

variable "routes" {
  type = map(object({
    address_prefix = string
    next_hop_type  = string
  }))
}