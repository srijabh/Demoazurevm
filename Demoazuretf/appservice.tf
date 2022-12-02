resource "azurerm_app_service" "demo" {
  location            = azurerm_resource_group.rg1.location
  name                = "appser1"
  resource_group_name = azurerm_resource_group.rg1.name

  app_service_plan_id = azurerm_app_service_plan.demo.id
}

resource "azurerm_app_service_plan" "demo" {
  location            = azurerm_resource_group.rg1.location
  name                = "appserplan"
  resource_group_name = azurerm_resource_group.rg1.name
  sku {
    size = "S1"
    tier = "Standard"
  }
}
