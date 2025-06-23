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
variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}
variable "env" {
  description = "The name of the resource group"
  type        = string
  default = "prod"
}
variable "location" {
  description = "The location of the resource group"
  type        = map(string)

  default = {
        "dev" = "westus2"
        "prod" = "eastus"
        "test" = "centralus"
    
    }
}



resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  #location = lookup(var.location , var.env, "westus2")
  location = lookup(var.location, terraform.workspace, "westus2")
  #lifecycle meta-arguments
  lifecycle {
    create_before_destroy = true
    prevent_destroy = false
    ignore_changes = [
        tags["lastUpdate"]
      ]
  }
}
# To import an existing resource group, run the following command in your terminal:
# terraform import azurerm_resource_group.rg "/subscriptions/68a67f0f-80b0-48b9-ac75-e150c8d6f02d/resourceGroups/rg-name"