mock_provider "azurerm" {}

run "test_advanced_example_with_cilium_and_node_pools" {
  command = apply
  module {
    source = "./examples/advanced"
  }

  override_resource {
    target = azurerm_resource_group.demo
    values = {
      id       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-demo-aks-we"
      name     = "rg-demo-aks-we"
      location = "westeurope"
    }
  }

  override_resource {
    target = module.kubernetes.azurerm_log_analytics_workspace.main[0]
    values = {
      id           = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-demo-aks-we/providers/Microsoft.OperationalInsights/workspaces/demo-prod-westeu"
      workspace_id = "00000000-0000-0000-0000-000000000001"
    }
  }

  override_resource {
    target = module.kubernetes.azurerm_kubernetes_cluster.main
    values = {
      id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-demo-aks-we/providers/Microsoft.ContainerService/managedClusters/demo-prod-westeu"
      name = "demo-prod-westeu"
      kube_config = [{
        host                   = "https://demo-prod-westeu.hcp.westeurope.azmk8s.io:443"
        cluster_ca_certificate = "dGVzdA=="
        client_certificate     = ""
        client_key             = ""
        username               = ""
        password               = ""
      }]
    }
  }

  override_data {
    target = module.kubernetes.data.azurerm_kubernetes_service_versions.current
    values = {
      latest_version = "1.30.0"
      versions       = ["1.29.0", "1.30.0"]
    }
  }

  assert {
    condition     = module.kubernetes.aks_credentials == "az aks get-credentials --resource-group rg-demo-aks-we --name demo-prod-westeu"
    error_message = "AKS credentials command should contain correct resource group and cluster name"
  }
}
