provider "azurerm" {
features {}
}

variable tag_based_webhooks{
    type = map( #alert object with defined threshold etc.
            object({  
                critical_webhook = list(string)
                high_webhook =  list(string)
            })
        )

    default = {
        "air" : {
            critical_webhook = ["https://jeremiah.example.com/prod/critical"]
            high_webhook =  ["https://jeremiah.example.com/prod/high"]
        },
        "cch" : {
            critical_webhook = ["https://jeremiah.example.com/cch/critical"]
            high_webhook =  ["https://jeremiah.example.com/cch/high"]
        }
    }          
}

data "azurerm_resources" "virtual_networks" {
    resource_group_name = var.resource_group_name
    type = "microsoft.network/virtualnetworks"
}

data "azurerm_resources" "virtual_machines" {
    resource_group_name = var.resource_group_name
    type = "microsoft.compute/virtualmachines"
}

data "azurerm_resources" "application_gateways" {
    resource_group_name = var.resource_group_name
    type = "microsoft.network/applicationgateways"
}

data "azurerm_resources" "firewalls" {
    resource_group_name = var.resource_group_name
    type = "microsoft.network/azurefirewalls"
}

data "azurerm_resources" "document_db" {
    resource_group_name = var.resource_group_name
    type = "microsoft.documentdb/databaseaccounts"
}

data "azurerm_resources" "cdn_profiles" {
    resource_group_name = var.resource_group_name
    type = "microsoft.cdn/profiles"
}

data "azurerm_resources" "container_registries" {
    resource_group_name = var.resource_group_name
    type = "microsoft.containerregistry/registries"
}

data "azurerm_resources" "managed_clusters" {
    resource_group_name = var.resource_group_name
    type = "microsoft.containerservice/managedclusters"
}

data "azurerm_resources" "dns_zones" {
    resource_group_name = var.resource_group_name
    type = "microsoft.network/dnszones"
}

data "azurerm_resources" "hdinsights_clusters" {
    resource_group_name = var.resource_group_name
    type = "microsoft.hdinsight/clusters"
}

data "azurerm_resources" "keyvaults" {
    resource_group_name = var.resource_group_name
    type = "microsoft.keyvault/vaults"
}

data "azurerm_resources" "load_balancers" {
    resource_group_name = var.resource_group_name
    type = "microsoft.network/loadbalancers"
}

data "azurerm_resources" "mysql_servers" {
    resource_group_name = var.resource_group_name
    type = "microsoft.dbformysql/servers"
}

data "azurerm_resources" "notification_hubs" {
    resource_group_name = var.resource_group_name
    type = "Microsoft.NotificationHubs/Namespaces/NotificationHubs"
}

data "azurerm_resources" "redis_caches" {
    resource_group_name = var.resource_group_name
    type = "microsoft.cache/redis"
}

data "azurerm_resources" "storage_accounts" {
    resource_group_name = var.resource_group_name
    type = "microsoft.storage/storageaccounts"
}

locals {
    resources = { for resource in concat(
        #data.azurerm_resources.virtual_networks.resources, 
        data.azurerm_resources.virtual_machines.resources,
        #data.azurerm_resources.application_gateways.resources,
        #data.azurerm_resources.firewalls.resources,
        #data.azurerm_resources.document_db.resources,
        #data.azurerm_resources.cdn_profiles.resources,
        #data.azurerm_resources.container_registries.resources,
        #data.azurerm_resources.managed_clusters.resources,
        #data.azurerm_resources.dns_zones.resources,
        #data.azurerm_resources.hdinsights_clusters.resources,
        #data.azurerm_resources.keyvaults.resources,
        #data.azurerm_resources.load_balancers.resources,
        #data.azurerm_resources.mysql_servers.resources,
        #data.azurerm_resources.notification_hubs.resources,
        #data.azurerm_resources.redis_caches.resources,
        data.azurerm_resources.storage_accounts.resources
        ):  lower(resource.id) => resource 
        }
}

module "monitor_activity_log" {
    for_each = local.resources
    
    source = "../monitor_activity_log"
    resource_group_name = var.resource_group_name
    resource_id = each.key
    crtical_webhook = var.tag_based_webhooks[each.value.tags["team"]].critical_webhook
    high_webhook = var.tag_based_webhooks[each.value.tags["team"]].high_webhook
}
