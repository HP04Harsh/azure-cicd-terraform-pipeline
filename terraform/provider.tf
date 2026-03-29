terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.66.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Terraform-State"
    storage_account_name = "gondialab"
    container_name       = "tfdata"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
   features {}
}