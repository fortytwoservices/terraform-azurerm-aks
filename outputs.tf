output "aks_id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = azurerm_kubernetes_cluster.main.id
}

output "node_resource_group_id" {
  description = "The Kubernetes Node Resource Group ID."
  value       = azurerm_kubernetes_cluster.main.node_resource_group_id
}

output "oidc_issuer_url" {
  description = "The OIDC issuer URL that is associated with the cluster."
  value       = azurerm_kubernetes_cluster.main.oidc_issuer_url
}

output "host" {
  description = "The Kubernetes cluster server host."
  value       = try(azurerm_kubernetes_cluster.main.kube_config[0].host, null)
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
  value       = try(azurerm_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate, null)
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

output "secret_identity" {
  description = "Block of the parameters from the Key Vault Secrets Provider."
  value       = var.key_vault_secrets_provider.enabled ? azurerm_kubernetes_cluster.main.key_vault_secrets_provider[0].secret_identity[0] : null
}

output "identity" {
  description = "Block of the parameters from the Managed Service Identity."
  value       = var.service_principal == null ? azurerm_kubernetes_cluster.main.identity : null
}
