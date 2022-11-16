module "kubernetes" {
  source  = "amestofortytwo/kubernetes"
  version = "1.1.0"

  name                = "demo-prod-westeu"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location

  tags = {
    environment = "production"
  }
}
