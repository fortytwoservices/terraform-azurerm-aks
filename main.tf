/*
* # Azure Kubernetes Service
*
* This is the repository for our Azure Kubernetes Service (AKS) Terraform module.
*/

resource "azurerm_kubernetes_cluster" "main" {
  name                = format("aks-%s", var.name)
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = replace(var.name, "-", "")
  kubernetes_version  = local.kubernetes_version

  default_node_pool {
    name       = var.default_node_pool.name
    node_count = var.default_node_pool.node_count
    vm_size    = var.default_node_pool.vm_size

    vnet_subnet_id = var.network_profile.vnet_subnet_id

  }

  dynamic "identity" {
    # Identity block is active if the service_principal variable is not set
    for_each = var.service_principal == null ? [1] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.identity_ids
    }
  }

  dynamic "service_principal" {
    # Service principal block is active if the service_principal variable is set
    for_each = var.service_principal != null ? [1] : []
    content {
      client_id     = var.service_principal.client_id
      client_secret = var.service_principal.client_secret
    }
  }

  # Network related settings
  network_profile {
    network_plugin     = var.network_profile.network_plugin
    network_policy     = var.network_profile.network_policy
    load_balancer_sku  = var.network_profile.load_balancer_sku
    outbound_type      = var.network_profile.outbound_type
    dns_service_ip     = var.network_profile.dns_service_ip
    docker_bridge_cidr = var.network_profile.docker_bridge_cidr
    pod_cidr           = var.network_profile.pod_cidr
    pod_cidrs          = var.network_profile.pod_cidrs
    service_cidr       = var.network_profile.service_cidr
    service_cidrs      = var.network_profile.service_cidrs
    ip_versions        = var.network_profile.ip_versions
    network_mode       = var.network_profile.network_mode
  }

  dynamic "ingress_application_gateway" {
    for_each = var.ingress_application_gateway != null ? [1] : []
    content {
      gateway_name = var.ingress_application_gateway.gateway_name
      gateway_id   = var.ingress_application_gateway.gateway_id
      subnet_cidr  = var.ingress_application_gateway.subnet_cidr
      subnet_id    = var.ingress_application_gateway.subnet_id
    }
  }

  tags = local.tags
}
