terraform {
  backend "azurerm" {
        resource_group_name  = "Gab_test"
        storage_account_name = "gabtestpleasedonotdelete"
        container_name       = "backendtf"
        key                  = "terraform.tfstate"

        access_key           = "W1QTt8vj0wa5y3frHgges3I8CTd8GZ+NB7XnfkfY8oVofnfHNnAZwxPXUY6NoXTMN1nmd/IC1SwUp9zFa8gzrQ==" // var.access_key
    }
}
