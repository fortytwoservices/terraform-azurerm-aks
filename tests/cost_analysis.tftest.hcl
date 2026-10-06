mock_provider "azurerm" {}

override_resource {
  target          = azurerm_kubernetes_cluster.main
  override_during = plan
  values = {
    kube_admin_config_raw = null
  }
}

variables {
  name                = "test-cost-analysis"
  location            = "westeurope"
  resource_group_name = "rg-test-cost-analysis"
  aad_rbac = {
    tenant_id = "00000000-0000-0000-0000-000000000001"
  }
}

run "cost_analysis_disabled_by_default" {
  command = plan

  assert {
    condition     = azurerm_kubernetes_cluster.main.cost_analysis_enabled == false
    error_message = "Cost analysis must be disabled by default."
  }
}

run "cost_analysis_enabled_standard" {
  command = plan

  variables {
    cost_analysis_enabled = true
    sku_tier              = "Standard"
  }

  assert {
    condition     = azurerm_kubernetes_cluster.main.cost_analysis_enabled == true
    error_message = "Cost analysis must be enabled for the Standard SKU when requested."
  }
}

run "cost_analysis_enabled_premium" {
  command = plan

  variables {
    cost_analysis_enabled = true
    sku_tier              = "Premium"
  }

  assert {
    condition     = azurerm_kubernetes_cluster.main.cost_analysis_enabled == true
    error_message = "Cost analysis must be enabled for the Premium SKU when requested."
  }
}

run "cost_analysis_rejected_free" {
  command = plan

  variables {
    cost_analysis_enabled = true
    sku_tier              = "Free"
  }

  expect_failures = [azurerm_kubernetes_cluster.main]
}