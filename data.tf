data "azurerm_kubernetes_service_versions" "current" {
  location        = var.location
  version_prefix  = var.automatic_bump_kubernetes_version.version_prefix
  include_preview = var.automatic_bump_kubernetes_version.include_preview
}
