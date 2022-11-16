variable "name" {
  description = <<EOT
  The name of the managed Kubernetes cluster.

  Will prefix the name of the cluster with `aks-`.
  EOT
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
  description = "A mapping of tags to assign to the resources"
  type        = map(string)
}

variable "default_node_pool" {
  description = <<EOT
  (Optional) The default node pool for the Kubernetes cluster.
  If not specified, the default node pool will have one Standard_d2s_v4 node.
  EOT
  type = object({
    name       = string
    node_count = number
    vm_size    = string
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
    name                 = string
    mode                 = optional(string)
    orchestrator_version = optional(string)
    os_type              = optional(string)
    os_sku               = optional(string)
    node_labels          = optional(map(string))
    node_count           = optional(number, 1)
    enable_auto_scaling  = optional(bool, false)
    min_count            = optional(number, 1)
    max_count            = optional(number, 3)
    vm_size              = optional(string)
    os_disk_size_gb      = optional(number)
    os_disk_type         = optional(string)
    vnet_subnet_id       = optional(string)
    max_pods             = optional(number)
    zones                = optional(list(string))
    scale_down_mode      = optional(string)
    ultra_ssd_enabled    = optional(bool)
    kubelet_disk_type    = optional(string)
    node_taints          = optional(list(string))
    tags                 = optional(map(string))
  }))
  default = []
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
  If not specified, the network profile will be of type Azure.
  EOT
  type = object({
    network_plugin     = string
    network_policy     = optional(string)
    network_mode       = optional(string)
    vnet_subnet_id     = optional(string)
    load_balancer_sku  = optional(string)
    outbound_type      = optional(string)
    dns_service_ip     = optional(string)
    docker_bridge_cidr = optional(string)
    service_cidr       = optional(string)
    service_cidrs      = optional(list(string))
    pod_cidr           = optional(string)
    pod_cidrs          = optional(list(string))
    ip_versions        = optional(list(string))
  })
  default = {
    network_plugin = "azure"
  }
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
