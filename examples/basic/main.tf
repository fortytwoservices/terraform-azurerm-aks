module "kubernetes" {
  source  = "amestofortytwo/aks"
  version = "1.2.0"

  name                = "demo-prod-westeu"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  tags = {
    environment = "production"
  }
}
