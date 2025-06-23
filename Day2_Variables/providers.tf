terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.31.0"
    }
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = "68a67f0f-80b0-48b9-ac75-e150c8d6f02d"
}
