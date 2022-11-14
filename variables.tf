variable "name" {
  description = "Name used for the resources created"
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
