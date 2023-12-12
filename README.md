<!-- BEGIN_TF_DOCS -->
# Azure Kubernetes Service

This is the repository for our Azure Kubernetes Service (AKS) Terraform module.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >3.63.0 |

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

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >3.63.0 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aad_rbac"></a> [aad\_rbac](#input\_aad\_rbac) | (Optional) Used to fill the azure\_active\_directory\_role\_based\_access\_control block for the Kubernetes cluster.<br>  If nothing is specified, managed AAD RBAC will be enabled.<br><br>  If managed is set to true, the admin\_group\_object\_ids properties can be specified to a group that will have admin access to the cluster. | <pre>object({<br>    managed                = optional(bool)<br>    tenant_id              = optional(string)<br>    admin_group_object_ids = optional(list(string))<br>    azure_rbac_enabled     = optional(bool)<br>    client_app_id          = optional(string)<br>    server_app_id          = optional(string)<br>    server_app_secret      = optional(string)<br>  })</pre> | <pre>{<br>  "admin_group_object_ids": null,<br>  "azure_rbac_enabled": true,<br>  "managed": true<br>}</pre> | no |
| <a name="input_additional_node_pools"></a> [additional\_node\_pools](#input\_additional\_node\_pools) | (Optional) A list of additional node pools to add to the Kubernetes cluster.<br><br>  Each node pool can have the following properties:<br>  name - (Required) The name of the node pool.<br>  node\_count - (optional) The number of nodes in the node pool, defaults to 1.<br>  vm\_size - (optional) The size of the virtual machines to use for the node pool, defaults to the same as the default node pool. | <pre>list(object({<br>    name                 = string<br>    mode                 = optional(string)<br>    orchestrator_version = optional(string)<br>    os_type              = optional(string)<br>    os_sku               = optional(string)<br>    node_labels          = optional(map(string))<br>    node_count           = optional(number)<br>    enable_auto_scaling  = optional(bool, false)<br>    min_count            = optional(number)<br>    max_count            = optional(number)<br>    vm_size              = optional(string)<br>    os_disk_size_gb      = optional(number)<br>    os_disk_type         = optional(string)<br>    vnet_subnet_id       = optional(string)<br>    pod_subnet_id        = optional(string)<br>    max_pods             = optional(number)<br>    zones                = optional(list(string))<br>    scale_down_mode      = optional(string)<br>    ultra_ssd_enabled    = optional(bool)<br>    kubelet_disk_type    = optional(string)<br>    node_taints          = optional(list(string))<br>    tags                 = optional(map(string))<br>    priority             = optional(string)<br>    spot_max_price       = optional(string)<br>    eviction_policy      = optional(string)<br><br>    linux_os_config = optional(object({<br>      swap_file_size_mb             = optional(number)<br>      transparent_huge_page_enabled = optional(bool)<br>      transparent_huge_page_defrag  = optional(string)<br><br>      sysctl_config = optional(object({<br>        vm_max_map_count = optional(number)<br>      }))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | (Optional) A list of authorized IP ranges to access the Kubernetes API server | `list(string)` | `null` | no |
| <a name="input_auto_scaler_profile"></a> [auto\_scaler\_profile](#input\_auto\_scaler\_profile) | The auto scaler profile for the Kubernetes cluster. | <pre>object({<br>    balance_similar_node_groups      = optional(bool)<br>    expander                         = optional(string)<br>    max_graceful_termination_sec     = optional(number)<br>    max_node_provisioning_time       = optional(string)<br>    max_unready_nodes                = optional(number)<br>    new_pod_scale_up_delay           = optional(string)<br>    scale_down_delay_after_add       = optional(string)<br>    scale_down_delay_after_delete    = optional(string)<br>    scale_down_delay_after_failure   = optional(string)<br>    scale_down_unneeded              = optional(string)<br>    scale_down_unready               = optional(string)<br>    scale_down_utilization_threshold = optional(string)<br>    empty_bulk_delete_max            = optional(number)<br>    skip_nodes_with_local_storage    = optional(bool)<br>    skip_nodes_with_system_pods      = optional(bool)<br>  })</pre> | `null` | no |
| <a name="input_automatic_bump_kubernetes_version"></a> [automatic\_bump\_kubernetes\_version](#input\_automatic\_bump\_kubernetes\_version) | Automatically bump the Kubernetes version to the latest available version | <pre>object({<br>    enabled         = bool<br>    version_prefix  = string<br>    include_preview = bool<br>  })</pre> | <pre>{<br>  "enabled": false,<br>  "include_preview": false,<br>  "version_prefix": "1.23"<br>}</pre> | no |
| <a name="input_automatic_channel_upgrade"></a> [automatic\_channel\_upgrade](#input\_automatic\_channel\_upgrade) | (Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none. | `string` | `"none"` | no |
| <a name="input_azure_monitor"></a> [azure\_monitor](#input\_azure\_monitor) | (Optional) Enable or disable Azure Monitor for the cluster. Defaults to true.<br>  If neither azure\_monitor.log\_analytics\_workspace\_id nor default\_log\_analytics\_workspace\_id is specified, a new Log Analytics Workspace will be created with the same name as the AKS cluster and in the same resource group. | <pre>object({<br>    enabled                    = optional(bool, true)<br>    log_analytics_workspace_id = optional(string, null)<br>  })</pre> | <pre>{<br>  "enabled": true,<br>  "log_analytics_workspace_id": null<br>}</pre> | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Enable or disable Azure Policy for the cluster. Defaults to true. | `bool` | `true` | no |
| <a name="input_default_log_analytics_workspace_id"></a> [default\_log\_analytics\_workspace\_id](#input\_default\_log\_analytics\_workspace\_id) | (Optional) The id of the Log Analytics Workspace to use as default for Defender and Azure Monitor.<br>  Each of these services can be configured to use a different Log Analytics Workspace, which will override this setting.<br>  If neither this nor the service spesific variable is specified, and the services are enabled, a new Log Analytics Workspace will be created. | `string` | `null` | no |
| <a name="input_default_node_pool"></a> [default\_node\_pool](#input\_default\_node\_pool) | (Optional) The default node pool for the Kubernetes cluster.<br>  If not specified, the default node pool will have one Standard\_d2s\_v4 node. | <pre>object({<br>    name    = string<br>    vm_size = string<br><br>    # Autoscale or manual scaling<br>    node_count          = optional(number)<br>    enable_auto_scaling = optional(bool)<br>    autoscale = optional(object({<br>      min_count = number<br>      max_count = number<br>    }))<br><br>    # Optional settings<br>    max_pods                      = optional(number)<br>    capacity_reservation_group_id = optional(string)<br>    enable_host_encryption        = optional(bool)<br>    enable_node_public_ip         = optional(bool)<br>    fips_enabled                  = optional(bool)<br>    kubelet_disk_type             = optional(string)<br>    message_of_the_day            = optional(string)<br>    node_public_ip_prefix_id      = optional(string)<br>    node_labels                   = optional(map(string))<br>    node_taints                   = optional(list(string))<br>    only_critical_addons_enabled  = optional(bool)<br>    orchestrator_version          = optional(string)<br>    os_disk_size_gb               = optional(number)<br>    os_disk_type                  = optional(string)<br>    os_sku                        = optional(string)<br>    pod_subnet_id                 = optional(string)<br>    scale_down_mode               = optional(string)<br>    type                          = optional(string)<br>    tags                          = optional(map(string))<br>    ultra_ssd_enabled             = optional(bool)<br>    zones                         = optional(list(string))<br><br>    kubelet_config = optional(object(<br>      {<br>        cpu_manager_policy        = optional(string)<br>        cpu_cfs_quota_enabled     = optional(bool)<br>        cpu_cfs_quota_period      = optional(string)<br>        image_gc_high_threshold   = optional(number)<br>        image_gc_low_threshold    = optional(number)<br>        topology_manager_policy   = optional(string)<br>        allowed_unsafe_sysctls    = optional(list(string))<br>        container_log_max_size_mb = optional(number)<br>        container_log_max_line    = optional(number)<br>        pod_max_pid               = optional(number)<br>      }<br>    ))<br><br>    linux_os_config = optional(object({<br>      # sysctl will not be implemented, until someone needs it<br>      swap_file_size_mb             = optional(number)<br>      transparent_huge_page_enabled = optional(bool)<br>      transparent_huge_page_defrag  = optional(string)<br>    }))<br><br>    upgrade_settings = optional(object({<br>      max_surge = optional(number)<br>    }))<br>  })</pre> | <pre>{<br>  "name": "default",<br>  "node_count": 1,<br>  "vm_size": "Standard_D2s_v4"<br>}</pre> | no |
| <a name="input_disk_encryption_set_id"></a> [disk\_encryption\_set\_id](#input\_disk\_encryption\_set\_id) | (Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) The identity block for the Kubernetes cluster.<br>  If not specified, the identity will be of type SystemAssigned. | <pre>object({<br>    type         = string<br>    identity_ids = optional(list(string))<br>  })</pre> | <pre>{<br>  "identity_ids": null,<br>  "type": "SystemAssigned"<br>}</pre> | no |
| <a name="input_ingress_application_gateway"></a> [ingress\_application\_gateway](#input\_ingress\_application\_gateway) | Values used for deployment of the ingress application gateway | <pre>object({<br>    gateway_id   = optional(string)<br>    gateway_name = optional(string)<br>    subnet_cidr  = optional(string)<br>    subnet_id    = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_key_vault_secrets_provider"></a> [key\_vault\_secrets\_provider](#input\_key\_vault\_secrets\_provider) | (Optional) Enable or disable Azure Key Vault Secret Providers for the cluster. Defaults to false. | <pre>object({<br>    enabled                  = optional(bool, false)<br>    secret_rotation_enabled  = optional(bool, false)<br>    secret_rotation_interval = optional(string, null)<br>  })</pre> | `{}` | no |
| <a name="input_kms_enabled"></a> [kms\_enabled](#input\_kms\_enabled) | (Optional) Enable Azure Key Vault Key Management Service. | `bool` | `false` | no |
| <a name="input_kms_key_vault_key_id"></a> [kms\_key\_vault\_key\_id](#input\_kms\_key\_vault\_key\_id) | (Optional) Identifier of Azure Key Vault key. When Azure Key Vault key management service is enabled, this field is required and must be a valid key identifier. | `string` | `null` | no |
| <a name="input_kms_key_vault_network_access"></a> [kms\_key\_vault\_network\_access](#input\_kms\_key\_vault\_network\_access) | (Optional) Network Access of Azure Key Vault. Possible values are: 'Private' and 'Public'. The default value is 'Private'. | `string` | `"Private"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version to use for the cluster | `string` | `null` | no |
| <a name="input_local_account_disabled"></a> [local\_account\_disabled](#input\_local\_account\_disabled) | (Optional) Enable or disable local account for the cluster. Defaults to true. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where all resources will be created | `string` | n/a | yes |
| <a name="input_microsoft_defender"></a> [microsoft\_defender](#input\_microsoft\_defender) | (Optional) Enable or disable Microsoft Defender (Security profile) for the cluster. Defaults to false.<br>  If neither microsoft\_defender.log\_analytics\_workspace\_id nor default\_log\_analytics\_workspace\_id is specified, a new Log Analytics Workspace will be created with the same name as the AKS cluster and in the same resource group. | <pre>object({<br>    enabled                    = optional(bool, false)<br>    log_analytics_workspace_id = optional(string, null)<br>  })</pre> | <pre>{<br>  "enabled": false,<br>  "log_analytics_workspace_id": null<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the managed Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_network_profile"></a> [network\_profile](#input\_network\_profile) | (Optional) The network profile block for the Kubernetes cluster.<br>  If not specified, the network profile will be of type Azure. | <pre>object({<br>    network_plugin      = string<br>    network_plugin_mode = optional(string)<br>    network_policy      = optional(string)<br>    network_mode        = optional(string)<br>    vnet_subnet_id      = optional(string)<br>    load_balancer_sku   = optional(string)<br>    outbound_type       = optional(string)<br>    dns_service_ip      = optional(string)<br>    docker_bridge_cidr  = optional(string)<br>    service_cidr        = optional(string)<br>    service_cidrs       = optional(list(string))<br>    pod_cidr            = optional(string)<br>    pod_cidrs           = optional(list(string))<br>    ip_versions         = optional(list(string))<br>    ebpf_data_plane     = optional(string)<br>  })</pre> | <pre>{<br>  "network_plugin": "azure"<br>}</pre> | no |
| <a name="input_private_cluster"></a> [private\_cluster](#input\_private\_cluster) | (Optional) Enable or disable private cluster for the cluster. Defaults to false. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to create the resources in | `string` | n/a | yes |
| <a name="input_service_principal"></a> [service\_principal](#input\_service\_principal) | (Optional) The service principal block for the Kubernetes cluster.<br>  Do not specify this block if you want already defined the identity block, or if you want to use the SystemAssigned identity. | <pre>object({<br>    client_id     = string<br>    client_secret = string<br>  })</pre> | `null` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | (Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, and Standard (which includes the Uptime SLA). Defaults to Free. | `string` | `"Free"` | no |
| <a name="input_storage_profile"></a> [storage\_profile](#input\_storage\_profile) | (Optional) The storage profile block for the Kubernetes cluster. | <pre>object({<br>    blob_driver_enabled         = optional(bool)<br>    disk_driver_enabled         = optional(bool)<br>    disk_driver_version         = optional(string)<br>    file_driver_enabled         = optional(bool)<br>    snapshot_controller_enabled = optional(bool)<br>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resources | `map(string)` | `{}` | no |
| <a name="input_workload_identity_enabled"></a> [workload\_identity\_enabled](#input\_workload\_identity\_enabled) | (Optional) Enable or disable workload identity for the cluster. Enabling this also sets oidc\_issuer\_enabled to true. | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_credentials"></a> [aks\_credentials](#output\_aks\_credentials) | The AZ CLI command to get credentials from your new cluster. |
| <a name="output_aks_id"></a> [aks\_id](#output\_aks\_id) | The Kubernetes Managed Cluster ID. |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Base64 encoded private key used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster. |
| <a name="output_host"></a> [host](#output\_host) | The Kubernetes cluster server host. |
| <a name="output_identity"></a> [identity](#output\_identity) | Block of the parameters from the Managed Service Identity. |
| <a name="output_kube_admin_config_raw"></a> [kube\_admin\_config\_raw](#output\_kube\_admin\_config\_raw) | The raw kube admin config, used with kubectl and other tools. |
| <a name="output_kubelet_identity"></a> [kubelet\_identity](#output\_kubelet\_identity) | The raw kubelet identity. Used for Azure role assignments. |
| <a name="output_oidc_issuer_url"></a> [oidc\_issuer\_url](#output\_oidc\_issuer\_url) | The OIDC issuer URL that is associated with the cluster. |
| <a name="output_secret_identity"></a> [secret\_identity](#output\_secret\_identity) | Block of the parameters from the Key Vault Secrets Provider. |

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.additional](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_log_analytics_workspace.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_kubernetes_service_versions.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_service_versions) | data source |
<!-- END_TF_DOCS -->