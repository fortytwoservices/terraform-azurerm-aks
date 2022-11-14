locals {
  # Kubernetes version handling
  kubernetes_version = var.automatic_bump_kubernetes_version.enabled ? data.azurerm_kubernetes_service_versions.current.latest_version : var.kubernetes_version

  tags = merge(
    {
      "source" = "terraform"
      "module" = "terraform-azurerm-aks"
    },
    var.tags,
  )
}
