resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = var.postgres_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location

  administrator_login    = var.postgres_admin_username
  administrator_password = var.postgres_admin_password

  sku_name   = "B_Standard_B1ms"
  version    = "14"
  storage_mb = 32768

  backup_retention_days = 7

  delegated_subnet_id = var.subnet_id

  public_network_access_enabled = false   # 🔥 FIX

  zone = "1"
  private_dns_zone_id = var.private_dns_zone_id

  tags = local.common_tags
}