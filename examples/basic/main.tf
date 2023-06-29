module "kubernetes" {
  source  = "amestofortytwo/aks/azurerm"
  version = "3.0.0"

  name                = "demo-prod-westeu"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  tags = {
    environment = "production"
  }
}
