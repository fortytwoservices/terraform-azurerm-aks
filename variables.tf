variable "name" {
  description = "The name of the managed Kubernetes cluster."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to create the resources in"
  type        = string
}

variable "location" {
  description = "The location where all resources will be created"
  type        = string
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "default_node_pool" {
  description = <<EOT
  (Optional) The default node pool for the Kubernetes cluster.
  If not specified, the default node pool will have one Standard_d2s_v4 node.
  EOT
  type = object({
    name    = string
    vm_size = string

    # Autoscale or manual scaling
    node_count           = optional(number)
    auto_scaling_enabled = optional(bool)
    autoscale = optional(object({
      min_count = number
      max_count = number
    }))

    # Optional settings
    max_pods                      = optional(number)
    capacity_reservation_group_id = optional(string)
    host_encryption_enabled       = optional(bool)
    node_public_ip_enabled        = optional(bool)
    fips_enabled                  = optional(bool)
    kubelet_disk_type             = optional(string)
    node_public_ip_prefix_id      = optional(string)
    node_labels                   = optional(map(string))
    only_critical_addons_enabled  = optional(bool)
    orchestrator_version          = optional(string)
    os_disk_size_gb               = optional(number)
    os_disk_type                  = optional(string)
    os_sku                        = optional(string)
    pod_subnet_id                 = optional(string)
    scale_down_mode               = optional(string)
    type                          = optional(string)
    tags                          = optional(map(string))
    ultra_ssd_enabled             = optional(bool)
    zones                         = optional(list(string))
    temporary_name_for_rotation   = optional(string)

    kubelet_config = optional(object(
      {
        cpu_manager_policy        = optional(string)
        cpu_cfs_quota_enabled     = optional(bool)
        cpu_cfs_quota_period      = optional(string)
        image_gc_high_threshold   = optional(number)
        image_gc_low_threshold    = optional(number)
        topology_manager_policy   = optional(string)
        allowed_unsafe_sysctls    = optional(list(string))
        container_log_max_size_mb = optional(number)
        container_log_max_line    = optional(number)
        pod_max_pid               = optional(number)
      }
    ))

    linux_os_config = optional(object({
      # sysctl will not be implemented, until someone needs it
      swap_file_size_mb             = optional(number)
      transparent_huge_page_enabled = optional(bool)
      transparent_huge_page_defrag  = optional(string)
      sysctl_config = optional(object({
        vm_max_map_count = optional(number)
      }))
    }))

    upgrade_settings = optional(object({
      max_surge                     = optional(string)
      drain_timeout_in_minutes      = optional(number)
      node_soak_duration_in_minutes = optional(number)
    }))
  })
  default = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v4"
  }
}

variable "additional_node_pools" {
  description = <<EOT
  (Optional) A list of additional node pools to add to the Kubernetes cluster.

  Each node pool can have the following properties:
  name - (Required) The name of the node pool.
  node_count - (optional) The number of nodes in the node pool, defaults to 1.
  vm_size - (optional) The size of the virtual machines to use for the node pool, defaults to the same as the default node pool.
  EOT
  type = list(object({
    name                    = string
    mode                    = optional(string)
    orchestrator_version    = optional(string)
    os_type                 = optional(string)
    os_sku                  = optional(string)
    host_encryption_enabled = optional(bool)
    node_labels             = optional(map(string))
    node_count              = optional(number)
    auto_scaling_enabled    = optional(bool, false)
    min_count               = optional(number)
    max_count               = optional(number)
    vm_size                 = optional(string)
    os_disk_size_gb         = optional(number)
    os_disk_type            = optional(string)
    vnet_subnet_id          = optional(string)
    pod_subnet_id           = optional(string)
    max_pods                = optional(number)
    zones                   = optional(list(string))
    scale_down_mode         = optional(string)
    ultra_ssd_enabled       = optional(bool)
    kubelet_disk_type       = optional(string)
    node_taints             = optional(list(string))
    tags                    = optional(map(string))
    priority                = optional(string)
    spot_max_price          = optional(string)
    eviction_policy         = optional(string)

    linux_os_config = optional(object({
      swap_file_size_mb             = optional(number)
      transparent_huge_page_enabled = optional(bool)
      transparent_huge_page_defrag  = optional(string)

      sysctl_config = optional(object({
        vm_max_map_count = optional(number)
      }))

      kubelet_config = optional(object({
        image_gc_high_threshold = optional(number)
        image_gc_low_threshold  = optional(number)
      }))
    }))

    upgrade_settings = optional(object({
      max_surge                     = optional(string)
      drain_timeout_in_minutes      = optional(number)
      node_soak_duration_in_minutes = optional(number)
    }))
  }))
  default = []
}

variable "auto_scaler_profile" {
  description = "The auto scaler profile for the Kubernetes cluster."
  type = object({
    balance_similar_node_groups      = optional(bool)
    expander                         = optional(string)
    max_graceful_termination_sec     = optional(number)
    max_node_provisioning_time       = optional(string)
    max_unready_nodes                = optional(number)
    new_pod_scale_up_delay           = optional(string)
    scale_down_delay_after_add       = optional(string)
    scale_down_delay_after_delete    = optional(string)
    scale_down_delay_after_failure   = optional(string)
    scale_down_unneeded              = optional(string)
    scale_down_unready               = optional(string)
    scale_down_utilization_threshold = optional(string)
    empty_bulk_delete_max            = optional(number)
    skip_nodes_with_local_storage    = optional(bool)
    skip_nodes_with_system_pods      = optional(bool)
  })
  default = null
}

variable "identity" {
  description = <<EOT
  (Optional) The identity block for the Kubernetes cluster.
  If not specified, the identity will be of type SystemAssigned.
  EOT
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = {
    type         = "SystemAssigned"
    identity_ids = null
  }
}

variable "kubelet_identity" {
  type = object({
    client_id                 = optional(string)
    object_id                 = optional(string)
    user_assigned_identity_id = optional(string)
  })
  default = {
    client_id                 = null
    object_id                 = null
    user_assigned_identity_id = null
  }
}

variable "workload_autoscaler_profile" {
  description = "The workload autoscaler profile for the Kubernetes cluster."
  type = object({
    keda_enabled                    = optional(bool)
    vertical_pod_autoscaler_enabled = optional(bool)
  })
  default = null
}

variable "aad_rbac" {
  description = <<EOT
  (Optional) Used to fill the azure_active_directory_role_based_access_control block for the Kubernetes cluster.
  If nothing is specified, managed AAD RBAC will be enabled.

  If managed is set to true, the admin_group_object_ids properties can be specified to a group that will have admin access to the cluster.
  EOT
  type = object({
    tenant_id              = optional(string)
    admin_group_object_ids = optional(list(string))
    azure_rbac_enabled     = optional(bool, true)
  })
  default = {
    azure_rbac_enabled     = true
    admin_group_object_ids = null
  }

}

variable "service_principal" {
  description = <<EOT
  (Optional) The service principal block for the Kubernetes cluster.
  Do not specify this block if you want already defined the identity block, or if you want to use the SystemAssigned identity.
  EOT
  type = object({
    client_id     = string
    client_secret = string
  })
  default = null
}

variable "network_profile" {
  description = <<EOT
  (Optional) The network profile block for the Kubernetes cluster.
  If not specified, the network plugin will be of type Azure, and network data plane and network policy of type Cilium.
  "network_policy": Supports the values "calico", "azure", "cilium", and "none". Set this to "none", if you previously had this unset or "null". "cilium" is the default value.
  EOT
  type = object({
    network_plugin      = optional(string, "azure")
    network_data_plane  = optional(string, "cilium")
    network_plugin_mode = optional(string)
    network_policy      = optional(string, "cilium")
    network_mode        = optional(string)
    vnet_subnet_id      = optional(string)
    load_balancer_sku   = optional(string)
    outbound_type       = optional(string)
    dns_service_ip      = optional(string)
    service_cidr        = optional(string)
    service_cidrs       = optional(list(string))
    pod_cidr            = optional(string)
    pod_cidrs           = optional(list(string))
    ip_versions         = optional(list(string))
  })
  default = {
    network_plugin     = "azure"
    network_policy     = "cilium"
    network_data_plane = "cilium"
  }
}

variable "storage_profile" {
  description = "(Optional) The storage profile block for the Kubernetes cluster."
  type = object({
    blob_driver_enabled         = optional(bool)
    disk_driver_enabled         = optional(bool)
    file_driver_enabled         = optional(bool)
    snapshot_controller_enabled = optional(bool)
  })
  default = null
}

variable "ingress_application_gateway" {
  description = "Values used for deployment of the ingress application gateway"
  type = object({
    gateway_id   = optional(string)
    gateway_name = optional(string)
    subnet_cidr  = optional(string)
    subnet_id    = optional(string)
  })
  default = null
}

variable "kubernetes_version" {
  description = "Kubernetes version to use for the cluster"
  type        = string
  default     = null
}

variable "automatic_bump_kubernetes_version" {
  description = "Automatically bump the Kubernetes version to the latest available version"
  type = object({
    enabled         = bool
    version_prefix  = string
    include_preview = bool
  })
  default = {
    enabled         = false
    version_prefix  = "1.23"
    include_preview = false
  }
}

variable "azure_policy_enabled" {
  description = "Enable or disable Azure Policy for the cluster. Defaults to true."
  type        = bool
  default     = true
}

variable "api_server_authorized_ip_ranges" {
  description = "(Optional) A list of authorized IP ranges to access the Kubernetes API server"
  type        = list(string)
  default     = null
}

variable "api_server_access_profile" {
  type = object({
    authorized_ip_ranges = optional(list(string))
  })
  default = null
}

variable "workload_identity_enabled" {
  description = "(Optional) Enable or disable workload identity for the cluster. Enabling this also sets oidc_issuer_enabled to true."
  type        = bool
  default     = null
}

variable "private_cluster" {
  description = "(Optional) Enable or disable private cluster for the cluster. Defaults to false."
  type        = bool
  default     = false
}

variable "private_dns_zone_id" {
  description = "(Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, System to have AKS manage this or None. In case of None you will need to bring your own DNS server and set up resolving, otherwise, the cluster will have issues after provisioning. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "local_account_disabled" {
  description = "(Optional) Enable or disable local account for the cluster. Defaults to true."
  type        = bool
  default     = true
}

variable "disk_encryption_set_id" {
  type        = string
  default     = null
  description = "(Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created."
}

variable "kms_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Enable Azure Key Vault Key Management Service."
  nullable    = false
}

variable "kms_key_vault_key_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of Azure Key Vault key. When Azure Key Vault key management service is enabled, this field is required and must be a valid key identifier."
}

variable "kms_key_vault_network_access" {
  type        = string
  default     = "Private"
  description = "(Optional) Network Access of Azure Key Vault. Possible values are: 'Private' and 'Public'. The default value is 'Private'."

  validation {
    condition     = contains(["Private", "Public"], var.kms_key_vault_network_access)
    error_message = "Possible values are 'Private' and 'Public'"
  }
}

variable "sku_tier" {
  description = "(Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, and Standard (which includes the Uptime SLA). Defaults to Free."
  type        = string
  default     = "Free"

  validation {
    condition     = contains(["Free", "Standard"], var.sku_tier)
    error_message = "Value must be either Free or Standard"
  }
}

variable "automatic_upgrade_channel" {
  description = "(Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none."
  type        = string
  default     = null

  validation {
    condition     = var.automatic_upgrade_channel == null ? true : contains(["patch", "rapid", "stable", "node-image"], var.automatic_upgrade_channel)
    error_message = "Value must be either patch, rapid, stable, node-image, or not defined (null)"
  }
}

variable "default_log_analytics_workspace_id" {
  description = <<EOF
  (Optional) The id of the Log Analytics Workspace to use as default for Defender and Azure Monitor.
  Each of these services can be configured to use a different Log Analytics Workspace, which will override this setting.
  If neither this nor the service spesific variable is specified, and the services are enabled, a new Log Analytics Workspace will be created.
  EOF
  type        = string
  default     = null
}

variable "log_analytics_workspace_retention" {
  description = "(Optional) The retention period in days for the default Log Analytics Workspace. Defaults to 30."
  type        = string
  default     = "30"
}

variable "log_analytics_workspace_sku" {
  description = "(Optional) The SKU of the default Log Analytics Workspace. Defaults to PerGB2018."
  type        = string
  default     = "PerGB2018"
}

variable "key_vault_secrets_provider" {
  description = "(Optional) Enable or disable Azure Key Vault Secret Providers for the cluster. Defaults to false."
  type = object({
    enabled                  = optional(bool, false)
    secret_rotation_enabled  = optional(bool, false)
    secret_rotation_interval = optional(string, null)
  })
  default = {}
}

variable "microsoft_defender" {
  description = <<EOF
  (Optional) Enable or disable Microsoft Defender (Security profile) for the cluster. Defaults to false.
  If neither microsoft_defender.log_analytics_workspace_id nor default_log_analytics_workspace_id is specified, a new Log Analytics Workspace will be created with the same name as the AKS cluster and in the same resource group.
  EOF
  type = object({
    enabled                    = optional(bool, false)
    log_analytics_workspace_id = optional(string, null)
  })
  default = {
    enabled                    = false
    log_analytics_workspace_id = null
  }
}

variable "azure_monitor" {
  description = <<EOF
  (Optional) Enable or disable Azure Monitor for the cluster. Defaults to true.
  If neither azure_monitor.log_analytics_workspace_id nor default_log_analytics_workspace_id is specified, a new Log Analytics Workspace will be created with the same name as the AKS cluster and in the same resource group.
  EOF
  type = object({
    enabled                         = optional(bool, true)
    log_analytics_workspace_id      = optional(string, null)
    msi_auth_for_monitoring_enabled = optional(bool, false)
  })
  default = {
    enabled                         = true
    log_analytics_workspace_id      = null
    msi_auth_for_monitoring_enabled = false
  }
}

variable "run_command_enabled" {
  description = "(Optional) Enable or disable Run Command for the cluster. Defaults to false."
  type        = bool
  default     = false
}

variable "image_cleaner_enabled" {
  description = "(Optional) Enable or disable Image Cleaner for the cluster. Defaults to false."
  type        = bool
  default     = false
}

variable "image_cleaner_interval_hours" {
  description = "(Optional) Specifies the interval in hours when images should be cleaned up. Defaults to 48."
  type        = number
  default     = 48
}

variable "node_os_upgrade_channel" {
  type        = string
  default     = "NodeImage"
  description = " (Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are `Unmanaged`, `SecurityPatch`, `NodeImage` and `None`. Defaults to `NodeImage`."

  validation {
    condition     = contains(["Unmanaged", "SecurityPatch", "NodeImage", "None"], var.node_os_upgrade_channel)
    error_message = "`node_os_upgrade_channel` value must be either Unmanaged, SecurityPatch, NodeImage, or None"
  }
}

variable "maintenance_window" {
  type = object({
    allowed = optional(list(object({
      day   = string
      hours = set(number)
    })), []),
    not_allowed = optional(list(object({
      end   = string
      start = string
    })), []),
  })
  default     = null
  description = "(Optional) Maintenance windows allowed and not allowed configuration of the managed cluster."
}

variable "maintenance_window_auto_upgrade" {
  type = object({
    day_of_month = optional(number)
    day_of_week  = optional(string)
    duration     = number
    frequency    = string
    interval     = number
    start_date   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    week_index   = optional(string)
    not_allowed = optional(set(object({
      end   = string
      start = string
    })))
  })
  default     = null
  description = "(Optional) Maintenance window for auto upgrade of the managed AKS cluster."
}

variable "maintenance_window_node_os" {
  type = object({
    day_of_month = optional(number)
    day_of_week  = optional(string)
    duration     = number
    frequency    = string
    interval     = number
    start_date   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    week_index   = optional(string)
    not_allowed = optional(set(object({
      end   = string
      start = string
    })))
  })
  default     = null
  description = "(Optional) Maintenance window for auto upgrade of the managed AKS cluster nodes OS."
}

variable "upgrade_override" {
  type = object({
    force_upgrade_enabled = optional(bool)
    effective_until       = optional(string)
  })
  default     = null
  description = "(Optional) Upgrade override for the managed AKS cluster."
}
