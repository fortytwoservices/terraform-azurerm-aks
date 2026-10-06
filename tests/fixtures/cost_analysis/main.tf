terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

variable "cost_analysis_enabled" {
  type    = bool
  default = null
}

variable "sku_tier" {
  type    = string
  default = "Free"
}

module "kubernetes" {
  source = "../../.."

  name                  = "test-cost-analysis"
  location              = "westeurope"
  resource_group_name   = "rg-test-cost-analysis"
  cost_analysis_enabled = var.cost_analysis_enabled
  sku_tier              = var.sku_tier

  aad_rbac = {
    tenant_id = "00000000-0000-0000-0000-000000000001"
  }

  node_provisioning_profile = {
    mode = "Manual"
  }
}