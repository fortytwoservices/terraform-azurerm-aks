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
