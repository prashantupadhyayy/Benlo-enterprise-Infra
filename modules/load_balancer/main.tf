resource "azurerm_lb" "lb" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = "Standard"

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = var.public_ip_id
  }

  tags = local.common_tags
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.backend_pool_name
}