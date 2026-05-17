variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "subnet_ids" {
  type = map(string)
}

variable "nsg_rules" {
  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string

    destination_port_ranges    = list(string)

    source_address_prefix      = string
    destination_address_prefix = string
  }))
}