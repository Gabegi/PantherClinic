module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.this.name
  address_space       = "10.3.0.0/16" #10.30.0.0/16
  subnet_prefixes     = ["10.3.1.0/24"] #10.30.1.0/24
  subnet_names        = ["subnet1"]
  depends_on          = [azurerm_resource_group.this]
}

module "aks" {

  source                           = "Azure/aks/azurerm"
  resource_group_name              = azurerm_resource_group.this.name
  # client_id                        = "your-service-principal-client-appid" ## service-principal 
  # client_secret                    = "your-service-principal-client-password" ## service-principal
  prefix                           = "prefix"
  cluster_name                     = "aks-${module.vars.env.name}-application"
  network_plugin                   = "azure"
  vnet_subnet_id                   = module.network.vnet_subnets[0]
  os_disk_size_gb                  = 50

  enable_role_based_access_control = true
  # rbac_aad_admin_group_object_ids  = [azuread_group.this.id]
  rbac_aad_managed                 = true
  enable_http_application_routing  = true
  enable_azure_policy              = true
  enable_auto_scaling              = true
  # enable_host_encryption           = true
  agents_min_count                 = 1
  agents_max_count                 = 2
  agents_count                     = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
  agents_max_pods                  = 100
  agents_pool_name                 = "exnodepool"
  agents_availability_zones        = ["1", "2"]
  agents_type                      = "VirtualMachineScaleSets"

  agents_labels = {
    "nodepool" : "defaultnodepool"
  }

  agents_tags = {
    "Agent" : "defaultnodepoolagent"
  }

  network_policy                 = "azure"
  net_profile_dns_service_ip     = "10.0.0.10"
  net_profile_docker_bridge_cidr = "170.10.0.1/16"
  net_profile_service_cidr       = "10.0.0.0/16"

  # depends_on = [module.network,
  # azuread_group.this]
}