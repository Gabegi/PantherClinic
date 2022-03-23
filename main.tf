
module "vars" {
    source      = "./modules/vars"
    environment = terraform.workspace
}

provider "azurerm" {
  # Configuration options
  features {
  }
  subscription_id = var.subscription_id
}

provider "azuread" {
  tenant_id       = var.tenantID
  # use_microsoft_graph = true
}

provider "azuread" {
  tenant_id       = var.tenantID
  alias           = "groups"
  # use_microsoft_graph = false
}

resource "azurerm_resource_group" "this" {
  name     =  module.vars.env.rg_name
  location = "West Europe"

}

