terraform {
  backend "azurerm" {
        resource_group_name  = "Gab_test"
        storage_account_name = "gabtestpleasedonotdelete"
        container_name       = "backendtf"
        key                  = "terraform.tfstate"

        access_key           = "string" // var.access_key
    }
}
