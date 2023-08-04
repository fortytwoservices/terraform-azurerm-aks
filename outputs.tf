output "aks_id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = azurerm_kubernetes_cluster.main.id
}

output "host" {
  description = "The Kubernetes cluster server host."
  value       = var.local_account_disabled ? null : try(azurerm_kubernetes_cluster.main.kube_config[0].host, null)
}

output "client_certificate" {
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
  value       = var.local_account_disabled ? null : try(azurerm_kubernetes_cluster.main.kube_admin_config[0].client_certificate, null)
}

output "client_key" {
  description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
  value       = var.local_account_disabled ? null : try(azurerm_kubernetes_cluster.main.kube_admin_config[0].client_key, null)
}

output "cluster_ca_certificate" {
  description = "Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
  value       = var.local_account_disabled ? null : try(azurerm_kubernetes_cluster.main.kube_admin_config[0].cluster_ca_certificate, null)
}

output "kube_admin_config_raw" {
  description = "The raw kube admin config, used with kubectl and other tools."
  value       = azurerm_kubernetes_cluster.main.kube_admin_config_raw
}

output "kubelet_identity" {
  description = "The raw kubelet identity. Used for Azure role assignments."
  value       = azurerm_kubernetes_cluster.main.kubelet_identity
}

output "aks_credentials" {
  description = "The AZ CLI command to get credentials from your new cluster."
  value       = format("az aks get-credentials --resource-group %s --name %s", var.resource_group_name, azurerm_kubernetes_cluster.main.name)
}

output "identity" {
  description = "Block of the parameters from the Managed Service Identity."
  value       = var.service_principal == null ? azurerm_kubernetes_cluster.main.identity : null
}