module "kubernetes" {
  source = "../"

  name                = "demo-prod-westeu"
  resource_group_name = "rg-demo-prod-westeu"
  location            = "westeurope"

  service_principal = {
    client_id     = "00000000-0000-0000-0000-000000000000"
    client_secret = "value"
  }

  automatic_bump_kubernetes_version = {
    enabled         = true
    version_prefix  = "1.23"
    include_preview = false
  }

  tags = {
    environment = "production"
  }
}
