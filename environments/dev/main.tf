module "network" {
  source = "../../modules/network"

  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnets             = var.subnets
}

module "nsg" {
  source = "../../modules/nsg"

  resource_group_name = var.resource_group_name
  location            = var.location

  nsg_name = "benlo-dev-nsg"

  subnet_ids = {
    web = module.network.subnet_ids["web"]
    app = module.network.subnet_ids["app"]
    db  = module.network.subnet_ids["db"]
  }
  nsg_rules = var.nsg_rules
}

module "route_table" {
  source = "../../modules/route_table"

  resource_group_name = var.resource_group_name
  location            = var.location

  route_table_name = "benlo-dev-rt"

  subnet_ids = module.network.subnet_ids
  routes     = var.routes
}

# NAT Gateway Public IP
module "public_ip" {
  source = "../../modules/public_ip"

  resource_group_name = var.resource_group_name
  location            = var.location

  public_ip_name = var.public_ip_name
}

module "nat_gateway" {
  source = "../../modules/nat_gateway"

  resource_group_name = var.resource_group_name
  location            = var.location

  nat_gateway_name = var.nat_gateway_name

  public_ip_id = module.public_ip.public_ip_id
  subnet_ids   = module.network.subnet_ids
}

module "storage_account" {
  source = "../../modules/storage_account"

  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name = var.storage_account_name
  container_names      = var.container_names
}

module "keyvault" {
  source = "../../modules/keyvault"

  resource_group_name = var.resource_group_name
  location            = var.location

  keyvault_name = var.keyvault_name
}

# Load Balancer Public IP
module "lb_public_ip" {
  source = "../../modules/public_ip"

  resource_group_name = var.resource_group_name
  location            = var.location

  public_ip_name = var.lb_public_ip_name
}

module "load_balancer" {
  source = "../../modules/load_balancer"

  resource_group_name = var.resource_group_name
  location            = var.location

  load_balancer_name = var.load_balancer_name
  frontend_ip_name   = var.frontend_ip_name
  backend_pool_name  = var.backend_pool_name

  public_ip_id = module.lb_public_ip.public_ip_id
}

# Application Gateway Public IP
module "appgw_public_ip" {
  source = "../../modules/public_ip"

  resource_group_name = var.resource_group_name
  location            = var.location

  public_ip_name = var.appgw_public_ip_name
}

module "application_gateway" {
  source = "../../modules/application_gateway"

  resource_group_name = var.resource_group_name
  location            = var.location

  application_gateway_name = var.application_gateway_name
  waf_policy_name          = var.waf_policy_name

  subnet_id = module.network.subnet_ids["agw"]

  public_ip_id = module.appgw_public_ip.public_ip_id
}
#DB
module "postgresql" {
  source = "../../modules/postgresql"

  resource_group_name = var.resource_group_name
  location            = var.location

  postgres_server_name    = var.postgres_server_name
  postgres_admin_username = var.postgres_admin_username
  postgres_admin_password = var.postgres_admin_password

  subnet_id           = module.network.subnet_ids["db"]
  private_dns_zone_id = module.private_dns.private_dns_zone_id
}
module "private_dns" {
  source = "../../modules/private_dns"

  resource_group_name = var.resource_group_name
  vnet_id = module.network.vnet_id
}

# Monitering

module "monitoring" {
  source = "../../modules/monitoring"

  resource_group_name = var.resource_group_name
  location            = var.location

  log_analytics_name = var.log_analytics_name
  app_insights_name  = var.app_insights_name
}
# Bastion
module "bastion" {
  source = "../../modules/bastion"

  resource_group_name = var.resource_group_name
  location            = var.location

  bastion_name = var.bastion_name

  subnet_id    = module.network.subnet_ids["bastion"]
  public_ip_id = module.public_ip.public_ip_id
}