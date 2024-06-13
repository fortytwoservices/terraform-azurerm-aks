<!-- BEGIN_TF_DOCS -->
# Azure Kubernetes Service

This is the repository for our Azure Kubernetes Service (AKS) Terraform module.

## Requirements

The following requirements are needed by this module:

- azurerm (>3.97.0)

## Examples

### Basic example

```hcl
module "kubernetes" {
  source  = "amestofortytwo/aks/azurerm"
  version = "3.0.0"

  name                = "demo-prod-westeu"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  tags = {
    environment = "production"
  }
}
```

### Advanced Example

```hcl
module "kubernetes" {
  source  = "amestofortytwo/aks/azurerm"
  version = "3.0.0"

  name                = "demo-prod-westeu"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  service_principal = {
    client_id     = "00000000-0000-0000-0000-000000000000"
    client_secret = "client_secret_value"
  }

  automatic_bump_kubernetes_version = {
    enabled         = true
    version_prefix  = "1.23"
    include_preview = false
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

- azurerm (>3.97.0)

## Modules

No modules.

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### location

Description: The location where all resources will be created

Type: `string`

### name

Description: The name of the managed Kubernetes cluster.

Type: `string`

### resource\_group\_name

Description: Name of the resource group to create the resources in

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### aad\_rbac

Description:   (Optional) Used to fill the azure\_active\_directory\_role\_based\_access\_control block for the Kubernetes cluster.  
  If nothing is specified, managed AAD RBAC will be enabled.

  If managed is set to true, the admin\_group\_object\_ids properties can be specified to a group that will have admin access to the cluster.

Type:

```hcl
object({
    managed                = optional(bool)
    tenant_id              = optional(string)
    admin_group_object_ids = optional(list(string))
    azure_rbac_enabled     = optional(bool)
    client_app_id          = optional(string)
    server_app_id          = optional(string)
    server_app_secret      = optional(string)
  })
```

Default:

```json
{
  "admin_group_object_ids": null,
  "azure_rbac_enabled": true,
  "managed": true
}
```

### additional\_node\_pools

Description:   (Optional) A list of additional node pools to add to the Kubernetes cluster.

  Each node pool can have the following properties:  
  name - (Required) The name of the node pool.  
  node\_count - (optional) The number of nodes in the node pool, defaults to 1.  
  vm\_size - (optional) The size of the virtual machines to use for the node pool, defaults to the same as the default node pool.

Type:

```hcl
list(object({
    name                 = string
    mode                 = optional(string)
    orchestrator_version = optional(string)
    os_type              = optional(string)
    os_sku               = optional(string)
    node_labels          = optional(map(string))
    node_count           = optional(number)
    enable_auto_scaling  = optional(bool, false)
    min_count            = optional(number)
    max_count            = optional(number)
    vm_size              = optional(string)
    os_disk_size_gb      = optional(number)
    os_disk_type         = optional(string)
    vnet_subnet_id       = optional(string)
    pod_subnet_id        = optional(string)
    max_pods             = optional(number)
    zones                = optional(list(string))
    scale_down_mode      = optional(string)
    ultra_ssd_enabled    = optional(bool)
    kubelet_disk_type    = optional(string)
    node_taints          = optional(list(string))
    tags                 = optional(map(string))
    priority             = optional(string)
    spot_max_price       = optional(string)
    eviction_policy      = optional(string)

    linux_os_config = optional(object({
      swap_file_size_mb             = optional(number)
      transparent_huge_page_enabled = optional(bool)
      transparent_huge_page_defrag  = optional(string)

      sysctl_config = optional(object({
        vm_max_map_count = optional(number)
      }))
    }))

    upgrade_settings = optional(object({
      max_surge = optional(string)
    }))
  }))
```

Default: `[]`

### api\_server\_authorized\_ip\_ranges

Description: (Optional) A list of authorized IP ranges to access the Kubernetes API server

Type: `list(string)`

Default: `null`

### auto\_scaler\_profile

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

### automatic\_bump\_kubernetes\_version

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

### automatic\_channel\_upgrade

Description: (Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none.

Type: `string`

Default: `null`

### azure\_monitor

Description:   (Optional) Enable or disable Azure Monitor for the cluster. Defaults to true.  
  If neither azure\_monitor.log\_analytics\_workspace\_id nor default\_log\_analytics\_workspace\_id is specified, a new Log Analytics Workspace will be created with the same name as the AKS cluster and in the same resource group.

Type:

```hcl
object({
    enabled                    = optional(bool, true)
    log_analytics_workspace_id = optional(string, null)
  })
```

Default:

```json
{
  "enabled": true,
  "log_analytics_workspace_id": null
}
```

### azure\_policy\_enabled

Description: Enable or disable Azure Policy for the cluster. Defaults to true.

Type: `bool`

Default: `true`

### default\_log\_analytics\_workspace\_id

Description:   (Optional) The id of the Log Analytics Workspace to use as default for Defender and Azure Monitor.  
  Each of these services can be configured to use a different Log Analytics Workspace, which will override this setting.  
  If neither this nor the service spesific variable is specified, and the services are enabled, a new Log Analytics Workspace will be created.

Type: `string`

Default: `null`

### default\_node\_pool

Description:   (Optional) The default node pool for the Kubernetes cluster.  
  If not specified, the default node pool will have one Standard\_d2s\_v4 node.

Type:

```hcl
object({
    name    = string
    vm_size = string

    # Autoscale or manual scaling
    node_count          = optional(number)
    enable_auto_scaling = optional(bool)
    autoscale = optional(object({
      min_count = number
      max_count = number
    }))

    # Optional settings
    max_pods                      = optional(number)
    capacity_reservation_group_id = optional(string)
    enable_host_encryption        = optional(bool)
    enable_node_public_ip         = optional(bool)
    fips_enabled                  = optional(bool)
    kubelet_disk_type             = optional(string)
    message_of_the_day            = optional(string)
    node_public_ip_prefix_id      = optional(string)
    node_labels                   = optional(map(string))
    node_taints                   = optional(list(string))
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
    }))

    upgrade_settings = optional(object({
      max_surge = optional(string)
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

### disk\_encryption\_set\_id

Description: (Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created.

Type: `string`

Default: `null`

### identity

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

### ingress\_application\_gateway

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

### key\_vault\_secrets\_provider

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

### kms\_enabled

Description: (Optional) Enable Azure Key Vault Key Management Service.

Type: `bool`

Default: `false`

### kms\_key\_vault\_key\_id

Description: (Optional) Identifier of Azure Key Vault key. When Azure Key Vault key management service is enabled, this field is required and must be a valid key identifier.

Type: `string`

Default: `null`

### kms\_key\_vault\_network\_access

Description: (Optional) Network Access of Azure Key Vault. Possible values are: 'Private' and 'Public'. The default value is 'Private'.

Type: `string`

Default: `"Private"`

### kubernetes\_version

Description: Kubernetes version to use for the cluster

Type: `string`

Default: `null`

### local\_account\_disabled

Description: (Optional) Enable or disable local account for the cluster. Defaults to true.

Type: `bool`

Default: `true`

### microsoft\_defender

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

### network\_profile

Description:   (Optional) The network profile block for the Kubernetes cluster.  
  If not specified, the network profile will be of type Azure.

Type:

```hcl
object({
    network_plugin      = string
    network_plugin_mode = optional(string)
    network_policy      = optional(string)
    network_mode        = optional(string)
    vnet_subnet_id      = optional(string)
    load_balancer_sku   = optional(string)
    outbound_type       = optional(string)
    dns_service_ip      = optional(string)
    docker_bridge_cidr  = optional(string)
    service_cidr        = optional(string)
    service_cidrs       = optional(list(string))
    pod_cidr            = optional(string)
    pod_cidrs           = optional(list(string))
    ip_versions         = optional(list(string))
    ebpf_data_plane     = optional(string)
  })
```

Default:

```json
{
  "network_plugin": "azure"
}
```

### private\_cluster

Description: (Optional) Enable or disable private cluster for the cluster. Defaults to false.

Type: `bool`

Default: `false`

### private\_dns\_zone\_id

Description: (Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, System to have AKS manage this or None. In case of None you will need to bring your own DNS server and set up resolving, otherwise, the cluster will have issues after provisioning. Changing this forces a new resource to be created.

Type: `string`

Default: `null`

### run\_command\_enabled

Description: (Optional) Enable or disable Run Command for the cluster. Defaults to false.

Type: `bool`

Default: `false`

### service\_principal

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

### sku\_tier

Description: (Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, and Standard (which includes the Uptime SLA). Defaults to Free.

Type: `string`

Default: `"Free"`

### storage\_profile

Description: (Optional) The storage profile block for the Kubernetes cluster.

Type:

```hcl
object({
    blob_driver_enabled         = optional(bool)
    disk_driver_enabled         = optional(bool)
    disk_driver_version         = optional(string)
    file_driver_enabled         = optional(bool)
    snapshot_controller_enabled = optional(bool)
  })
```

Default: `null`

### tags

Description: (Optional) A mapping of tags to assign to the resources

Type: `map(string)`

Default: `{}`

### workload\_identity\_enabled

Description: (Optional) Enable or disable workload identity for the cluster. Enabling this also sets oidc\_issuer\_enabled to true.

Type: `bool`

Default: `null`

## Outputs

The following outputs are exported:

### aks\_credentials

Description: The AZ CLI command to get credentials from your new cluster.

### aks\_id

Description: The Kubernetes Managed Cluster ID.

### client\_certificate

Description: Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster.

### client\_key

Description: Base64 encoded private key used by clients to authenticate to the Kubernetes cluster.

### cluster\_ca\_certificate

Description: Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster.

### host

Description: The Kubernetes cluster server host.

### identity

Description: Block of the parameters from the Managed Service Identity.

### kube\_admin\_config\_raw

Description: The raw kube admin config, used with kubectl and other tools.

### kubelet\_identity

Description: The raw kubelet identity. Used for Azure role assignments.

### oidc\_issuer\_url

Description: The OIDC issuer URL that is associated with the cluster.

### secret\_identity

Description: Block of the parameters from the Key Vault Secrets Provider.

<!-- markdownlint-enable -->
## Resources

The following resources are used by this module:

- [azurerm_kubernetes_cluster.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) (resource)
- [azurerm_kubernetes_cluster_node_pool.additional](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) (resource)
- [azurerm_log_analytics_workspace.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) (resource)
- [azurerm_kubernetes_service_versions.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_service_versions) (data source)
<!-- END_TF_DOCS -->