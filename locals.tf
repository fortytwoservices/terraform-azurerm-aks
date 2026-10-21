locals {
  # Kubernetes version handling
  # null leaves the version to Azure (the provider treats it as optional and computed), see var.manage_kubernetes_version
  kubernetes_version = !var.manage_kubernetes_version ? null : (var.automatic_bump_kubernetes_version.enabled ? data.azurerm_kubernetes_service_versions.current.latest_version : var.kubernetes_version)

  tags = merge(
    {
      "source" = "terraform"
      "module" = "fortytwoservices/terraform-azurerm-aks"
    },
    var.tags,
  )
}
