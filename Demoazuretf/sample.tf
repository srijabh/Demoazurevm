provider "azurerm"  {
    features {}
}

variable "demorg" {}
variable "loc" {
  default = "eastus"
}

resource "azurerm_resource_group" "demorg123" {
  location = var.loc
  name = var.demorg
}

resource "azurerm_resource_group" "rg1" {
  location = "eastus"
  name     = "trainingeast"
}

resource "azurerm_resource_group" "rg2" {
  location = "westus"
  name     = "trainingwest"
  tags = {
    "env": "dev'"
  }
}





