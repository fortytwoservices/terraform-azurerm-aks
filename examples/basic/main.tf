#trivy:ignore:azu-0065
module "kubernetes" {
  source  = "fortytwoservices/aks/azurerm"
  version = "4.2.0"

  name                = "demo-prod-westeu"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  network_profile = {
    network_plugin = "azure"
    network_policy = "azure"
  }

  tags = {
    environment = "production"
  }
}
