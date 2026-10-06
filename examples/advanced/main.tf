#trivy:ignore:azu-0065
module "kubernetes" {
  source = "../.."

  name                = "demo-prod-westeu"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  aad_rbac = {
    tenant_id = "00000000-0000-0000-0000-000000000000"
  }

  node_provisioning_profile = {
    mode = "Manual"
  }

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
