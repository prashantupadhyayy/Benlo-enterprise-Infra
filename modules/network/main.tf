resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space

  tags = local.common_tags
}
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = each.key == "bastion" ? "AzureBastionSubnet" : each.key
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]

  dynamic "delegation" {
    for_each = each.key == "db" ? [1] : []

    content {
      name = "postgres-delegation"

      service_delegation {
        name = "Microsoft.DBforPostgreSQL/flexibleServers"

        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action"
        ]
      }
    }
  }
}