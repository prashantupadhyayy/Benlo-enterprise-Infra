output "vmss_id" {
  value = azurerm_linux_virtual_machine_scale_set.vmss.id
}

output "vmss_nic_id" {
  value = azurerm_linux_virtual_machine_scale_set.vmss.network_interface
}