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
