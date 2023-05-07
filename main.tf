terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.43.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.SUB_ID
  tenant_id       = var.TENANT_ID
}

resource "azurerm_resource_group" "rsg" {
  name     = var.RG_NAME
  location = var.LOCATION_NAME
}

resource "azurerm_container_registry" "acr" {
  name                = var.ACR_NAME
  resource_group_name = azurerm_resource_group.rsg.name
  location            = azurerm_resource_group.rsg.location
  sku                 = "Basic"
  admin_enabled       = true

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_service_plan" "asp" {
  name                = var.ASP_NAME
  resource_group_name = azurerm_resource_group.rsg.name
  location            = azurerm_resource_group.rsg.location
  os_type             = var.OS_TYPE
  sku_name            = var.SKU_NAME
  worker_count = 3
  zone_balancing_enabled = true
}

resource "azurerm_linux_web_app" "web" {
  name                = var.WEB_NAME
  resource_group_name = azurerm_resource_group.rsg.name
  location            = azurerm_resource_group.rsg.location
  service_plan_id     = azurerm_service_plan.asp.id

  app_settings = {
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.acr.admin_password
    "DOCKER_REGISTRY_SERVER_URL" = azurerm_container_registry.acr.login_server
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.acr.admin_username
  }

  site_config {
    container_registry_managed_identity_client_id = azurerm_container_registry.acr.identity[0].principal_id
    
      application_stack {
       docker_image = var.IMG_NAME
       docker_image_tag = "lastest"
      }
  }
}