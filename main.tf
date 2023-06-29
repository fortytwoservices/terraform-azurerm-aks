/*
* # Azure Kubernetes Service
*
* This is the repository for our Azure Kubernetes Service (AKS) Terraform module.
*/

resource "azurerm_kubernetes_cluster" "main" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  dns_prefix                      = replace(var.name, "-", "")
  kubernetes_version              = local.kubernetes_version
  azure_policy_enabled            = var.azure_policy_enabled
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  workload_identity_enabled       = var.workload_identity_enabled
  oidc_issuer_enabled             = var.workload_identity_enabled == true ? true : null
  private_cluster_enabled         = var.private_cluster
  local_account_disabled          = var.local_account_disabled

  default_node_pool {
    name                 = var.default_node_pool.name
    node_count           = var.default_node_pool.node_count
    vm_size              = var.default_node_pool.vm_size
    vnet_subnet_id       = var.network_profile.vnet_subnet_id
    orchestrator_version = lookup(var.default_node_pool, "orchestration_version", false) ? var.default_node_pool.orchestration_version : local.kubernetes_version

    # Optional settings
    max_pods                      = var.default_node_pool.max_pods
    capacity_reservation_group_id = var.default_node_pool.capacity_reservation_group_id
    enable_host_encryption        = var.default_node_pool.enable_host_encryption
    enable_node_public_ip         = var.default_node_pool.enable_node_public_ip
    fips_enabled                  = var.default_node_pool.fips_enabled
    kubelet_disk_type             = var.default_node_pool.kubelet_disk_type
    message_of_the_day            = var.default_node_pool.message_of_the_day
    node_public_ip_prefix_id      = var.default_node_pool.node_public_ip_prefix_id
    node_labels                   = var.default_node_pool.node_labels
    only_critical_addons_enabled  = var.default_node_pool.only_critical_addons_enabled
    os_disk_size_gb               = var.default_node_pool.os_disk_size_gb
    os_disk_type                  = var.default_node_pool.os_disk_type
    os_sku                        = var.default_node_pool.os_sku
    pod_subnet_id                 = var.default_node_pool.pod_subnet_id
    scale_down_mode               = var.default_node_pool.scale_down_mode
    type                          = var.default_node_pool.type
    ultra_ssd_enabled             = var.default_node_pool.ultra_ssd_enabled

    dynamic "kubelet_config" {
      for_each = var.default_node_pool.kubelet_config != null ? [1] : []

      content {
        cpu_manager_policy        = var.default_node_pool.kubelet_config.cpu_manager_policy
        cpu_cfs_quota_enabled     = var.default_node_pool.kubelet_config.cpu_cfs_quota
        cpu_cfs_quota_period      = var.default_node_pool.kubelet_config.cpu_cfs_quota_period
        image_gc_high_threshold   = var.default_node_pool.kubelet_config.image_gc_high_threshold
        image_gc_low_threshold    = var.default_node_pool.kubelet_config.image_gc_low_threshold
        topology_manager_policy   = var.default_node_pool.kubelet_config.topology_manager_policy
        allowed_unsafe_sysctls    = var.default_node_pool.kubelet_config.allowed_unsafe_sysctls
        container_log_max_size_mb = var.default_node_pool.kubelet_config.container_log_max_size_mb
        container_log_max_line    = var.default_node_pool.kubelet_config.container_log_max_line
        pod_max_pid               = var.default_node_pool.kubelet_config.pod_max_pids
      }
    }

    dynamic "linux_os_config" {
      for_each = var.default_node_pool.linux_os_config != null ? [1] : []

      content {
        swap_file_size_mb             = var.default_node_pool.linux_os_config.swap_file_size_mb
        transparent_huge_page_enabled = var.default_node_pool.linux_os_config.transparent_huge_page_enabled
        transparent_huge_page_defrag  = var.default_node_pool.linux_os_config.transparent_huge_page_defrag

      }
    }

    tags = merge(
      local.tags,
      var.default_node_pool.tags,
    )
  }

  azure_active_directory_role_based_access_control {
    managed                = var.aad_rbac.managed
    tenant_id              = var.aad_rbac.tenant_id
    admin_group_object_ids = var.aad_rbac.admin_group_object_ids
    azure_rbac_enabled     = var.aad_rbac.azure_rbac_enabled
    client_app_id          = var.aad_rbac.client_app_id
    server_app_id          = var.aad_rbac.server_app_id
    server_app_secret      = var.aad_rbac.server_app_secret
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
    network_plugin      = var.network_profile.network_plugin
    network_policy      = var.network_profile.network_policy
    network_plugin_mode = var.network_profile.network_plugin_mode
    load_balancer_sku   = var.network_profile.load_balancer_sku
    outbound_type       = var.network_profile.outbound_type
    dns_service_ip      = var.network_profile.dns_service_ip
    docker_bridge_cidr  = var.network_profile.docker_bridge_cidr
    pod_cidr            = var.network_profile.pod_cidr
    pod_cidrs           = var.network_profile.pod_cidrs
    service_cidr        = var.network_profile.service_cidr
    service_cidrs       = var.network_profile.service_cidrs
    ip_versions         = var.network_profile.ip_versions
    network_mode        = var.network_profile.network_mode
    ebpf_data_plane     = var.network_profile.ebpf_data_plane
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

  lifecycle {
    precondition {
      condition     = (!(var.local_account_disabled == true && var.aad_rbac.managed == false))
      error_message = <<EOF
If local_account_disabled is set to true, it is required to enable Kubernetes RBAC and AKS-managed Azure AD integration. 
See the documentation for more information (https://docs.microsoft.com/azure/aks/managed-aad#azure-ad-authentication-overview).
      EOF
    }
  }

  tags = local.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "additional" {
  for_each = { for np in var.additional_node_pools : np.name => np }

  name                  = each.value.name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id
  node_count            = each.value.node_count
  vm_size               = each.value.vm_size == null ? var.default_node_pool.vm_size : each.value.vm_size
  vnet_subnet_id        = var.network_profile.vnet_subnet_id
  pod_subnet_id         = each.value.pod_subnet_id
  orchestrator_version  = each.value.orchestrator_version == null ? local.kubernetes_version : each.value.orchestrator_version
  max_pods              = each.value.max_pods
  node_labels           = each.value.node_labels
  node_taints           = each.value.node_taints
  enable_auto_scaling   = each.value.enable_auto_scaling
  min_count             = each.value.min_count
  max_count             = each.value.max_count
  os_disk_size_gb       = each.value.os_disk_size_gb
  os_disk_type          = each.value.os_disk_type
  kubelet_disk_type     = each.value.kubelet_disk_type
  ultra_ssd_enabled     = each.value.ultra_ssd_enabled
  zones                 = each.value.zones
  tags                  = merge(local.tags, each.value.tags)
}
