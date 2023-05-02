provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = "valheim-infra"
  location = "North Europe"
}

resource "azurerm_service_plan" "sp" {
  name                = "valheim-serviceplan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "valheim-webapp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.sp.id

  site_config {}
}
