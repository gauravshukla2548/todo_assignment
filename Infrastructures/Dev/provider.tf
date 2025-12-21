terraform {

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"


    }
  }

   backend "azurerm" {
     resource_group_name  = "back_rg"
     storage_account_name = "backacc123322121"
     container_name       = "backend"
     key                  = "terraform.tfstate"

   }
}


provider "azurerm" {

  features {}
  subscription_id = "de1c1815-4f90-412b-9551-d55f0de9407d"

}
