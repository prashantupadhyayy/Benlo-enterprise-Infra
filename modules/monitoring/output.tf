output "log_analytics_id" {
  value = azurerm_log_analytics_workspace.law.id
}

output "app_insights_id" {
  value = azurerm_application_insights.ai.id
}