mock_provider "azurerm" {}

run "cost_analysis_disabled_by_default" {
  command = plan

  module {
    source = "./tests/fixtures/cost_analysis"
  }
}

run "cost_analysis_enabled_standard" {
  command = plan

  module {
    source = "./tests/fixtures/cost_analysis"
  }

  variables {
    cost_analysis_enabled = true
    sku_tier              = "Standard"
  }
}

run "cost_analysis_enabled_premium" {
  command = plan

  module {
    source = "./tests/fixtures/cost_analysis"
  }

  variables {
    cost_analysis_enabled = true
    sku_tier              = "Premium"
  }
}

run "cost_analysis_disabled_free" {
  command = plan

  module {
    source = "./tests/fixtures/cost_analysis"
  }

  variables {
    cost_analysis_enabled = false
    sku_tier              = "Free"
  }
}