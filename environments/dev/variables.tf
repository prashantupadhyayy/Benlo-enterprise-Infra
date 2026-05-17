variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "address_space" {}
variable "subnets" {}
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
variable "appgw_public_ip_name" {
  type = string
}

variable "routes" {
  type = map(object({
    address_prefix = string
    next_hop_type  = string
  }))
}
variable "public_ip_name" {
  type = string
}
variable "nat_gateway_name" {
  type = string
}
variable "storage_account_name" {
  type = string
}

variable "container_names" {
  type = list(string)
}
variable "keyvault_name" {
  type = string
}

variable "vmss_name" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "ssh_public_key" {
  type = string
}
variable "load_balancer_name" {
  type = string
}

variable "frontend_ip_name" {
  type = string
}

variable "backend_pool_name" {
  type = string
}
variable "lb_public_ip_name" {
  type = string
}
variable "application_gateway_name" {
  type = string
}

variable "waf_policy_name" {
  type = string
}

variable "postgres_server_name" {
  type = string
}

variable "postgres_admin_username" {
  type = string
}

variable "postgres_admin_password" {
  type = string
}

variable "log_analytics_name" {
  type = string
}

variable "app_insights_name" {
  type = string
}

variable "bastion_name" {
  type = string
}