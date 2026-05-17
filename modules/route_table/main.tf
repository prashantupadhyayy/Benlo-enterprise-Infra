resource "azurerm_route_table" "rt" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = local.common_tags
}

resource "azurerm_route" "routes" {
  for_each = var.routes

  name                = each.key
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.rt.name

  address_prefix = each.value.address_prefix
  next_hop_type  = each.value.next_hop_type
}

# ✅ FIX: Bastion subnet exclude
resource "azurerm_subnet_route_table_association" "association" {
  for_each = {
    for k, v in var.subnet_ids : k => v
    if k != "bastion"
  }

  subnet_id      = each.value
  route_table_id = azurerm_route_table.rt.id
}