output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "subnet_ids" {
  value = {
    for subnet_name, subnet in azurerm_subnet.subnet :
    subnet_name => subnet.id
  }
}