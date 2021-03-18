terraform {  
  backend "azurerm" {
    }
}
provider "azurerm" {
  features {}
}

resource "azurerm_app_service_plan" "main" {
  name                = "docker-asp"
  location            = "eastus"
  resource_group_name = "tf-example"
  kind                = "Linux"
  reserved            = true
  
  sku {    
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "main" {
  name                = "docker-app-service"
  location            = "eastus"
  resource_group_name = "tf-example"
  app_service_plan_id = "${azurerm_app_service_plan.main.id}"
}
