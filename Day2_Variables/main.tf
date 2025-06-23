locals {
  rg_name1 = "sumithra"
} 

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name1
  location = var.env == "dev" ? var.rg_loc1 : var.rg_loc2
}

# out put varible
output "location_output"{
    value = azurerm_resource_group.rg.location
}