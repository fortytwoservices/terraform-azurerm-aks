<!-- BEGIN_TF_DOCS -->
# Azure Kubernetes Service

This is the repository for our Azure Kubernetes Service (AKS) Terraform module.

| :exclamation:  NB! |
|---|
| Due to the renaming of Company, the Github organization has changed name from "amestofortytwo" to "fortytwoservices". Pre-existing Terraform code would need to change that in code. |

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 4.0.0)

## Examples

### Basic example

```hcl
#trivy:ignore:avd-azu-0041
module "kubernetes" {
  source  = "fortytwoservices/aks/azurerm"
  version = "4.2.0"

  name                = "demo-prod-westeu"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  network_profile = {
    network_plugin = "azure"
    network_policy = "azure"
  }

  tags = {
    environment = "production"
  }
}
```

### Advanced Example

```hcl
#trivy:ignore:avd-azu-0041
module "kubernetes" {
  source  = "fortytwoservices/aks/azurerm"
  version = "4.2.0"

  name                = "demo-prod-westeu"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  network_profile = {
    network_plugin     = "azure"
    network_policy     = "cilium"
    network_data_plane = "cilium"
  }

  additional_node_pools = [
    { name = "pool1" },
    { name = "pool2" }
  ]

  tags = {
    environment = "production"
  }
}
```

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 4.0.0)

## Resources

The following resources are used by this module:

- [azurerm_kubernetes_cluster.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) (resource)
- [azurerm_kubernetes_cluster_node_pool.additional](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) (resource)
- [azurerm_log_analytics_workspace.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) (resource)
- [azurerm_kubernetes_service_versions.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_service_versions) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_location"></a> [location](#input\_location)

Description: The location where all resources will be created

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the managed Kubernetes cluster.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: Name of the resource group to create the resources in

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aad_rbac"></a> [aad\_rbac](#input\_aad\_rbac)

Description:   (Optional) Used to fill the azure\_active\_directory\_role\_based\_access\_control block for the Kubernetes cluster.  
  If nothing is specified, managed AAD RBAC will be enabled.

  If managed is set to true, the admin\_group\_object\_ids properties can be specified to a group that will have admin access to the cluster.

Type:

```hcl
object({
    tenant_id              = optional(string)
    admin_group_object_ids = optional(list(string))
    azure_rbac_enabled     = optional(bool, true)
  })
```

Default:

```json
{
  "admin_group_object_ids": null,
  "azure_rbac_enabled": true
}
```

### <a name="input_additional_node_pools"></a> [additional\_node\_pools](#input\_additional\_node\_pools)

Description:   (Optional) A list of additional node pools to add to the Kubernetes cluster.

  Each node pool can have the following properties:  
  name - (Required) The name of the node pool.  
  node\_count - (optional) The number of nodes in the node pool, defaults to 1.  
  vm\_size - (optional) The size of the virtual machines to use for the node pool, defaults to the same as the default node pool.

Type:

```hcl
list(object({
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
    }))

    upgrade_settings = optional(object({
      max_surge                     = optional(string)
      drain_timeout_in_minutes      = optional(number)
      node_soak_duration_in_minutes = optional(number)
    }))
  }))
```

Default: `[]`

### <a name="input_api_server_access_profile"></a> [api\_server\_access\_profile](#input\_api\_server\_access\_profile)

Description: n/a

Type:

```hcl
object({
    authorized_ip_ranges = optional(list(string))
  })
```

Default: `null`

### <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges)

Description: (Optional) A list of authorized IP ranges to access the Kubernetes API server

Type: `list(string)`

Default: `null`

### <a name="input_auto_scaler_profile"></a> [auto\_scaler\_profile](#input\_auto\_scaler\_profile)

Description: The auto scaler profile for the Kubernetes cluster.

Type:

```hcl
object({
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
```

Default: `null`

### <a name="input_automatic_bump_kubernetes_version"></a> [automatic\_bump\_kubernetes\_version](#input\_automatic\_bump\_kubernetes\_version)

Description: Automatically bump the Kubernetes version to the latest available version

Type:

```hcl
object({
    enabled         = bool
    version_prefix  = string
    include_preview = bool
  })
```

Default:

```json
{
  "enabled": false,
  "include_preview": false,
  "version_prefix": "1.23"
}
```

### <a name="input_automatic_upgrade_channel"></a> [automatic\_upgrade\_channel](#input\_automatic\_upgrade\_channel)

Description: (Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none.

Type: `string`

Default: `null`

### <a name="input_azure_monitor"></a> [azure\_monitor](#input\_azure\_monitor)

Description:   (Optional) Enable or disable Azure Monitor for the cluster. Defaults to true.  
  If neither azure\_monitor.log\_analytics\_workspace\_id nor default\_log\_analytics\_workspace\_id is specified, a new Log Analytics Workspace will be created with the same name as the AKS cluster and in the same resource group.

Type:

```hcl
object({
    enabled                         = optional(bool, true)
    log_analytics_workspace_id      = optional(string, null)
    msi_auth_for_monitoring_enabled = optional(bool, false)
  })
```

Default:

```json
{
  "enabled": true,
  "log_analytics_workspace_id": null,
  "msi_auth_for_monitoring_enabled": false
}
```

### <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled)

Description: Enable or disable Azure Policy for the cluster. Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_default_log_analytics_workspace_id"></a> [default\_log\_analytics\_workspace\_id](#input\_default\_log\_analytics\_workspace\_id)

Description:   (Optional) The id of the Log Analytics Workspace to use as default for Defender and Azure Monitor.  
  Each of these services can be configured to use a different Log Analytics Workspace, which will override this setting.  
  If neither this nor the service spesific variable is specified, and the services are enabled, a new Log Analytics Workspace will be created.

Type: `string`

Default: `null`

### <a name="input_default_node_pool"></a> [default\_node\_pool](#input\_default\_node\_pool)

Description:   (Optional) The default node pool for the Kubernetes cluster.  
  If not specified, the default node pool will have one Standard\_d2s\_v4 node.

Type:

```hcl
object({
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
```

Default:

```json
{
  "name": "default",
  "node_count": 1,
  "vm_size": "Standard_D2s_v4"
}
```

### <a name="input_disk_encryption_set_id"></a> [disk\_encryption\_set\_id](#input\_disk\_encryption\_set\_id)

Description: (Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created.

Type: `string`

Default: `null`

### <a name="input_identity"></a> [identity](#input\_identity)

Description:   (Optional) The identity block for the Kubernetes cluster.  
  If not specified, the identity will be of type SystemAssigned.

Type:

```hcl
object({
    type         = string
    identity_ids = optional(list(string))
  })
```

Default:

```json
{
  "identity_ids": null,
  "type": "SystemAssigned"
}
```

### <a name="input_image_cleaner_enabled"></a> [image\_cleaner\_enabled](#input\_image\_cleaner\_enabled)

Description: (Optional) Enable or disable Image Cleaner for the cluster. Defaults to false.

Type: `bool`

Default: `false`

### <a name="input_image_cleaner_interval_hours"></a> [image\_cleaner\_interval\_hours](#input\_image\_cleaner\_interval\_hours)

Description: (Optional) Specifies the interval in hours when images should be cleaned up. Defaults to 48.

Type: `number`

Default: `48`

### <a name="input_ingress_application_gateway"></a> [ingress\_application\_gateway](#input\_ingress\_application\_gateway)

Description: Values used for deployment of the ingress application gateway

Type:

```hcl
object({
    gateway_id   = optional(string)
    gateway_name = optional(string)
    subnet_cidr  = optional(string)
    subnet_id    = optional(string)
  })
```

Default: `null`

### <a name="input_key_vault_secrets_provider"></a> [key\_vault\_secrets\_provider](#input\_key\_vault\_secrets\_provider)

Description: (Optional) Enable or disable Azure Key Vault Secret Providers for the cluster. Defaults to false.

Type:

```hcl
object({
    enabled                  = optional(bool, false)
    secret_rotation_enabled  = optional(bool, false)
    secret_rotation_interval = optional(string, null)
  })
```

Default: `{}`

### <a name="input_kms_enabled"></a> [kms\_enabled](#input\_kms\_enabled)

Description: (Optional) Enable Azure Key Vault Key Management Service.

Type: `bool`

Default: `false`

### <a name="input_kms_key_vault_key_id"></a> [kms\_key\_vault\_key\_id](#input\_kms\_key\_vault\_key\_id)

Description: (Optional) Identifier of Azure Key Vault key. When Azure Key Vault key management service is enabled, this field is required and must be a valid key identifier.

Type: `string`

Default: `null`

### <a name="input_kms_key_vault_network_access"></a> [kms\_key\_vault\_network\_access](#input\_kms\_key\_vault\_network\_access)

Description: (Optional) Network Access of Azure Key Vault. Possible values are: 'Private' and 'Public'. The default value is 'Private'.

Type: `string`

Default: `"Private"`

### <a name="input_kubelet_identity"></a> [kubelet\_identity](#input\_kubelet\_identity)

Description: n/a

Type:

```hcl
object({
    client_id                 = optional(string)
    object_id                 = optional(string)
    user_assigned_identity_id = optional(string)
  })
```

Default:

```json
{
  "client_id": null,
  "object_id": null,
  "user_assigned_identity_id": null
}
```

### <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version)

Description: Kubernetes version to use for the cluster

Type: `string`

Default: `null`

### <a name="input_local_account_disabled"></a> [local\_account\_disabled](#input\_local\_account\_disabled)

Description: (Optional) Enable or disable local account for the cluster. Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_log_analytics_workspace_retention"></a> [log\_analytics\_workspace\_retention](#input\_log\_analytics\_workspace\_retention)

Description: (Optional) The retention period in days for the default Log Analytics Workspace. Defaults to 30.

Type: `string`

Default: `"30"`

### <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku)

Description: (Optional) The SKU of the default Log Analytics Workspace. Defaults to PerGB2018.

Type: `string`

Default: `"PerGB2018"`

### <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window)

Description: (Optional) Maintenance windows allowed and not allowed configuration of the managed cluster.

Type:

```hcl
object({
    allowed = optional(list(object({
      day   = string
      hours = set(number)
    })), []),
    not_allowed = optional(list(object({
      end   = string
      start = string
    })), []),
  })
```

Default: `null`

### <a name="input_maintenance_window_auto_upgrade"></a> [maintenance\_window\_auto\_upgrade](#input\_maintenance\_window\_auto\_upgrade)

Description: (Optional) Maintenance window for auto upgrade of the managed AKS cluster.

Type:

```hcl
object({
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
```

Default: `null`

### <a name="input_maintenance_window_node_os"></a> [maintenance\_window\_node\_os](#input\_maintenance\_window\_node\_os)

Description: (Optional) Maintenance window for auto upgrade of the managed AKS cluster nodes OS.

Type:

```hcl
object({
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
```

Default: `null`

### <a name="input_microsoft_defender"></a> [microsoft\_defender](#input\_microsoft\_defender)

Description:   (Optional) Enable or disable Microsoft Defender (Security profile) for the cluster. Defaults to false.  
  If neither microsoft\_defender.log\_analytics\_workspace\_id nor default\_log\_analytics\_workspace\_id is specified, a new Log Analytics Workspace will be created with the same name as the AKS cluster and in the same resource group.

Type:

```hcl
object({
    enabled                    = optional(bool, false)
    log_analytics_workspace_id = optional(string, null)
  })
```

Default:

```json
{
  "enabled": false,
  "log_analytics_workspace_id": null
}
```

### <a name="input_network_profile"></a> [network\_profile](#input\_network\_profile)

Description:   (Optional) The network profile block for the Kubernetes cluster.  
  If not specified, the network plugin will be of type Azure, and network data plane and network policy of type Cilium.
  "network\_policy": Supports the values "calico", "azure", "cilium", and "none". Set this to "none", if you previously had this unset or "null". "cilium" is the default value.

Type:

```hcl
object({
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
```

Default:

```json
{
  "network_data_plane": "cilium",
  "network_plugin": "azure",
  "network_policy": "cilium"
}
```

### <a name="input_node_os_upgrade_channel"></a> [node\_os\_upgrade\_channel](#input\_node\_os\_upgrade\_channel)

Description:  (Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are `Unmanaged`, `SecurityPatch`, `NodeImage` and `None`. Defaults to `NodeImage`.

Type: `string`

Default: `"NodeImage"`

### <a name="input_private_cluster"></a> [private\_cluster](#input\_private\_cluster)

Description: (Optional) Enable or disable private cluster for the cluster. Defaults to false.

Type: `bool`

Default: `false`

### <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id)

Description: (Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, System to have AKS manage this or None. In case of None you will need to bring your own DNS server and set up resolving, otherwise, the cluster will have issues after provisioning. Changing this forces a new resource to be created.

Type: `string`

Default: `null`

### <a name="input_run_command_enabled"></a> [run\_command\_enabled](#input\_run\_command\_enabled)

Description: (Optional) Enable or disable Run Command for the cluster. Defaults to false.

Type: `bool`

Default: `false`

### <a name="input_service_principal"></a> [service\_principal](#input\_service\_principal)

Description:   (Optional) The service principal block for the Kubernetes cluster.  
  Do not specify this block if you want already defined the identity block, or if you want to use the SystemAssigned identity.

Type:

```hcl
object({
    client_id     = string
    client_secret = string
  })
```

Default: `null`

### <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier)

Description: (Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, and Standard (which includes the Uptime SLA). Defaults to Free.

Type: `string`

Default: `"Free"`

### <a name="input_storage_profile"></a> [storage\_profile](#input\_storage\_profile)

Description: (Optional) The storage profile block for the Kubernetes cluster.

Type:

```hcl
object({
    blob_driver_enabled         = optional(bool)
    disk_driver_enabled         = optional(bool)
    file_driver_enabled         = optional(bool)
    snapshot_controller_enabled = optional(bool)
  })
```

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: (Optional) A mapping of tags to assign to the resources

Type: `map(string)`

Default: `{}`

### <a name="input_upgrade_override"></a> [upgrade\_override](#input\_upgrade\_override)

Description: (Optional) Upgrade override for the managed AKS cluster.

Type:

```hcl
object({
    force_upgrade_enabled = optional(bool)
    effective_until       = optional(string)
  })
```

Default: `null`

### <a name="input_workload_autoscaler_profile"></a> [workload\_autoscaler\_profile](#input\_workload\_autoscaler\_profile)

Description: The workload autoscaler profile for the Kubernetes cluster.

Type:

```hcl
object({
    keda_enabled                    = optional(bool)
    vertical_pod_autoscaler_enabled = optional(bool)
  })
```

Default: `null`

### <a name="input_workload_identity_enabled"></a> [workload\_identity\_enabled](#input\_workload\_identity\_enabled)

Description: (Optional) Enable or disable workload identity for the cluster. Enabling this also sets oidc\_issuer\_enabled to true.

Type: `bool`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_aks_credentials"></a> [aks\_credentials](#output\_aks\_credentials)

Description: The AZ CLI command to get credentials from your new cluster.

### <a name="output_aks_id"></a> [aks\_id](#output\_aks\_id)

Description: The Kubernetes Managed Cluster ID.

### <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate)

Description: Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster.

### <a name="output_client_key"></a> [client\_key](#output\_client\_key)

Description: Base64 encoded private key used by clients to authenticate to the Kubernetes cluster.

### <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate)

Description: Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster.

### <a name="output_host"></a> [host](#output\_host)

Description: The Kubernetes cluster server host.

### <a name="output_identity"></a> [identity](#output\_identity)

Description: Block of the parameters from the Managed Service Identity.

### <a name="output_kube_admin_config_raw"></a> [kube\_admin\_config\_raw](#output\_kube\_admin\_config\_raw)

Description: The raw kube admin config, used with kubectl and other tools.

### <a name="output_kubelet_identity"></a> [kubelet\_identity](#output\_kubelet\_identity)

Description: The raw kubelet identity. Used for Azure role assignments.

### <a name="output_oidc_issuer_url"></a> [oidc\_issuer\_url](#output\_oidc\_issuer\_url)

Description: The OIDC issuer URL that is associated with the cluster.

### <a name="output_secret_identity"></a> [secret\_identity](#output\_secret\_identity)

Description: Block of the parameters from the Key Vault Secrets Provider.

## Modules

No modules.

<!-- END_TF_DOCS -->