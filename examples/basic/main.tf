#trivy:ignore:azu-0065
module "kubernetes" {
  source = "../.."

  name                = "demo-prod-westeu"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  aad_rbac = {
    tenant_id = "00000000-0000-0000-0000-000000000000"
  }

  network_profile = {
    network_plugin = "azure"
    network_policy = "azure"
  }

  tags = {
    environment = "production"
  }
}
