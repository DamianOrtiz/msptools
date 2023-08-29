locals{
    # This is necessary for filtering the alerts by resource type. The resource id is being split on the / 
    # and then elements 6 and 8 are being recombined to create a representation of the resource namespace. 
    # EX. microsoft.compute/virtualmachines
    resource_types = { for id in local.resource_id_list_compiled :  id => lower(join("/", slice(split("/", id ), 6,8))) }
}

variable "resource_type_alerts" {
    type = map( #resource provider
       map(  #alerts
        map( #alert object with defined threshold etc.
            object({  
                aggregation =  string
                description = string
                frequency = string
                metric_name = string
                metric_namespace = string
                name = string
                severity = number
                threshold = string
                operator = string
                window_size = string
                critical_alert = bool
            })
        )
       )
    )
    
    default = {
        "microsoft.storage/storageaccounts" : {
            "alerts" : {
                "Critical-Availability" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Availability Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Availability",
                    "metric_namespace" : "Microsoft.Storage/storageAccounts",
                    "name" : "Critical-Availability",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-Availability" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Availability Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Availability",
                    "metric_namespace" : "Microsoft.Storage/storageAccounts",
                    "name" : "High-Availability",
                    "severity" : 1,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-Egress" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Egress Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Egress",
                    "metric_namespace" : "Microsoft.Storage/storageAccounts",
                    "name" : "Critical-Egress",
                    "severity" : 0,
                    "threshold" : 5000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-Egress" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Egress Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Egress",
                    "metric_namespace" : "Microsoft.Storage/storageAccounts",
                    "name" : "High-Egress",
                    "severity" : 1,
                    "threshold" : 5000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-Ingress" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Ingress Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Ingress",
                    "metric_namespace" : "Microsoft.Storage/storageAccounts",
                    "name" : "Critical-Ingress",
                    "severity" : 0,
                    "threshold" : 1000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-Ingress" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Ingress Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Ingress",
                    "metric_namespace" : "Microsoft.Storage/storageAccounts",
                    "name" : "High-Ingress",
                    "severity" : 1,
                    "threshold" : 1000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-Transactions" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Transactions Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Transactions",
                    "metric_namespace" : "Microsoft.Storage/storageAccounts",
                    "name" : "Critical-Transactions",
                    "severity" : 0,
                    "threshold" : 1000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-Transactions" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Transactions Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Transactions",
                    "metric_namespace" : "Microsoft.Storage/storageAccounts",
                    "name" : "High-Transactions",
                    "severity" : 1,
                    "threshold" : 1000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-UsedCapacity" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical UsedCapacity Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "UsedCapacity",
                    "metric_namespace" : "Microsoft.Storage/storageAccounts",
                    "name" : "Critical-UsedCapacity",
                    "severity" : 0,
                    "threshold" : 1000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT1H"
                },
                "High-UsedCapacity" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High UsedCapacity Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "UsedCapacity",
                    "metric_namespace" : "Microsoft.Storage/storageAccounts",
                    "name" : "High-UsedCapacity",
                    "severity" : 1,
                    "threshold" : 1000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT1H"
                }
            }
        },
        "microsoft.cache/redis" : {
            "alerts" : {
                "Critical-cachehits" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Cache Hits Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cachehits",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-cachehits",
                    "severity" : 0,
                    "threshold" : 5000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-cachehits" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Cache Hits Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cachehits",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-cachehits",
                    "severity" : 0,
                    "threshold" : 5000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-cachemisses" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Cache Misses Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cachemisses",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-cachemisses",
                    "severity" : 0,
                    "threshold" : 5000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-cachemisses" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Cache Misses Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cachemisses",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-cachemisses",
                    "severity" : 0,
                    "threshold" : 5000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-cachemissrate" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Cache miss rate Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cachemissrate",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-cachemissrate",
                    "severity" : 0,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-cachemissrate" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Cache miss rate Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cachemissrate",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-cachemissrate",
                    "severity" : 0,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-cacheRead" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical cache Read Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cacheRead",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-cacheRead",
                    "severity" : 0,
                    "threshold" : 80000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-cacheRead" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High cache Read Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cacheRead",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-cacheRead",
                    "severity" : 0,
                    "threshold" : 80000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-cacheWrite" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical cache Write Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cacheWrite",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-cacheWrite",
                    "severity" : 0,
                    "threshold" : 80000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-cacheWrite" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High cache Write Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cacheWrite",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-cacheWrite",
                    "severity" : 0,
                    "threshold" : 80000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-connectedclients" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical connected clients Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "connectedclients",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-connectedclients",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-connectedclients" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High connected clients Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "connectedclients",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-connectedclients",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-errors" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "errors",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-errors",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-errors" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Redis errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "errors",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-errors",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-evictedkeys" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Evicted Keys Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "evictedkeys",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-evictedkeys",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-evictedkeys" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Evicted Keys Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "evictedkeys",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-evictedkeys",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-expiredkeys" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical expired keys Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "expiredkeys",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-expiredkeys",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-expiredkeys" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High expired keys Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "expiredkeys",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-expiredkeys",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-getcommands" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis get commands Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "getcommands",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-getcommands",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-getcommands" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Redis get commands Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "getcommands",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-getcommands",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-operationsPerSecond" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis operations Per Second Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "operationsPerSecond",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-operationsPerSecond",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-operationsPerSecond" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Redis operations Per Second Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "operationsPerSecond",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-operationsPerSecond",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-percentProcessorTime" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis percent Processor Time Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "percentProcessorTime",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-percentProcessorTime",
                    "severity" : 0,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-percentProcessorTime" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Redis percent Processor Time Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "percentProcessorTime",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-percentProcessorTime",
                    "severity" : 0,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-serverLoad" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis server Load Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "serverLoad",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-serverLoad",
                    "severity" : 0,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-serverLoad" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Redis server Load Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "serverLoad",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-serverLoad",
                    "severity" : 0,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-setcommands" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis set commands Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "setcommands",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-setcommands",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-setcommands" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Redis set commands Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "setcommands",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-setcommands",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-totalcommandsprocessed" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis total commands processed Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "totalcommandsprocessed",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-totalcommandsprocessed",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-totalcommandsprocessed" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Redis total commands processed Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "totalcommandsprocessed",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-totalcommandsprocessed",
                    "severity" : 0,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-totalkeys" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis totalkeys Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "totalkeys",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-totalkeys",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-totalkeys" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Redis totalkeys Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "totalkeys",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-totalkeys",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-usedmemory" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis used memory Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "usedmemory",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-usedmemory",
                    "severity" : 0,
                    "threshold" : 1000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-usedmemory" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Redis used memory Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "usedmemory",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-usedmemory",
                    "severity" : 0,
                    "threshold" : 1000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-usedmemorypercentage" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis used memory percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "usedmemorypercentage",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-usedmemorypercentage",
                    "severity" : 0,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-usedmemorypercentage" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Redis used memory percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "usedmemorypercentage",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-usedmemorypercentage",
                    "severity" : 0,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-usedmemoryRss" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Redis used memory percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "usedmemoryRss",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "Critical-usedmemoryRss",
                    "severity" : 0,
                    "threshold" : 8000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-usedmemoryRss" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Redis used memory percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "usedmemoryRss",
                    "metric_namespace" : "Microsoft.Cache/redis",
                    "name" : "High-usedmemoryRss",
                    "severity" : 0,
                    "threshold" : 8000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.notificationhubs/namespaces" : {
            "alerts" : {
                "Critical-incoming.all.failedrequests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Incoming all failed requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "incoming.all.failedrequests",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical-incoming.all.failedrequests",
                    "severity" : 0,
                    "threshold" : 200,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-incoming.all.failedrequests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Incoming all failed requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "incoming.all.failedrequests",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High-incoming.all.failedrequests",
                    "severity" : 1,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-incoming.all.requests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical incoming all requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "incoming.all.requests",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical-incoming.all.requests",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-incoming.all.requests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High incoming all requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "incoming.all.requests",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High-incoming.all.requests",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-notificationhub.pushes" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical notification hub pushes Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "notificationhub.pushes",
                    "metric_namespace" : "Microsoft.NotificationHubs/namespaces/notificationHubs",
                    "name" : "Critical-notificationhub.pushes",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-notificationhub.pushes" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High notification hub pushes Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "notificationhub.pushes",
                    "metric_namespace" : "Microsoft.NotificationHubs/namespaces/notificationHubs",
                    "name" : "High-notificationhub.pushes",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.apns.pnserror" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical outgoing apns pnserror Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.apns.pnserror",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical-outgoing.apns.pnserror",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.apns.pnserror" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High outgoing apns pnserror Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.apns.pnserror",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High-outgoing.apns.pnserror",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.apns.success" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical outgoing apns success Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.apns.success",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- outgoing.apns.success",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.apns.success" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High outgoing apns success Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.apns.success",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- outgoing.apns.success",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.allpns.badorexpiredchannel" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Bad or Expired Channel Errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.allpns.badorexpiredchannel",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- outgoing.allpns.badorexpiredchannel",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.allpns.badorexpiredchannel" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Bad or Expired Channel Errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.allpns.badorexpiredchannel",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- outgoing.allpns.badorexpiredchannel",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.allpns.pnserror" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical External Notification System Errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.allpns.pnserror",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical-outgoing.outgoing.allpns.pnserror",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.allpns.pnserror" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High External Notification System Errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.allpns.pnserror",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High-outgoing.outgoing.allpns.pnserror",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.gcm.pnserror" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical GCM Errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.gcm.pnserror",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- outgoing.gcm.pnserror",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.gcm.pnserror" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High GCM Errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.gcm.pnserror",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- outgoing.gcm.pnserror",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.gcm.success" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical GCM Successful Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.gcm.success",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- outgoing.gcm.success",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.gcm.success" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High GCM Successful Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.gcm.success",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- outgoing.gcm.success",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.gcm.throttled" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical GCM Throttled Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.gcm.throttled",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- outgoing.gcm.throttled",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.gcm.throttled" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High GCM Throttled Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.gcm.throttled",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- outgoing.gcm.throttled",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-incoming" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Incoming Messages Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "incoming",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- incoming",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-incoming" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Incoming Messages Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "incoming",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- incoming",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.mpns.pnserror" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical MPNS Errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.mpns.pnserror",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- outgoing.mpns.pnserror",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.mpns.pnserror" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High MPNS Errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.mpns.pnserror",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- outgoing.mpns.pnserror",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.mpns.success" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical MPNS Successful Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.mpns.success",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- outgoing.mpns.success",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.mpns.success" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High MPNS Successful Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.mpns.success",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- outgoing.mpns.success",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.mpns.throttled" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical MPNS Throttled Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.mpns.throttled",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- outgoing.mpns.throttled",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.mpns.throttled" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High MPNS Throttled Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.mpns.throttled",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- outgoing.mpns.throttled",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-scheduled.pending" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Pending Scheduled Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "scheduled.pending",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical-scheduled.pending",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-scheduled.pending" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Pending Scheduled Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "scheduled.pending",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High-scheduled.pending",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-registration.create" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Registration Create Operations Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "registration.create",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- registration.create",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-registration.create" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Registration Create Operations Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "registration.create",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- registration.create",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-registration.delete" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Registration Delete Operations Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "registration.delete",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- registration.delete",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-registration.delete" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Registration Delete Operations Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "registration.delete",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- registration.delete",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-incoming.scheduled.cancel" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Scheduled Push Notifications Cancelled Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "incoming.scheduled.cancel",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical-incoming.scheduled.cancel",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-incoming.scheduled.cancel" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Scheduled Push Notifications Cancelled Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "incoming.scheduled.cancel",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High-incoming.scheduled.cancel",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-incoming.scheduled" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Scheduled Push Notifications Sent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "incoming.scheduled",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical- incoming.scheduled",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-incoming.scheduled" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Scheduled Push Notifications Sent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "incoming.scheduled",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High- incoming.scheduled",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.allpns.success" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Successful notifications Sent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.allpns.success",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical-outgoing.allpns.success",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.allpns.success" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Successful notifications Sent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.allpns.success",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High-outgoing.allpns.success",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.wns.pnserror" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical WNS Errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.wns.pnserror",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical-outgoing.wns.pnserror",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.wns.pnserror" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High WNS Errors Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.wns.pnserror",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High-outgoing.wns.pnserror",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.wns.success" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical WNS Successful Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.wns.success",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical-outgoing.wns.success",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.wns.success" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High WNS Successful Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.wns.success",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High-outgoing.wns.success",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-outgoing.wns.throttled" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical WNS Throttled Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.wns.throttled",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "Critical-outgoing.wns.throttled",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-outgoing.wns.throttled" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High WNS Throttled Notifications Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "outgoing.wns.throttled",
                    "metric_namespace" : "Microsoft.NotificationHubs/Namespaces/NotificationHubs",
                    "name" : "High-outgoing.wns.throttled",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.dbformysql/servers": {
            "alerts" : {
                "Critical-connections_failed" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical connections failed Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "connections_failed",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-connections_failed",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-connections_failed" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High connections failed Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "connections_failed",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-connections_failed",
                    "severity" : 1,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-seconds_behind_master" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Seconds behind master Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "seconds_behind_master",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-seconds_behind_master",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-seconds_behind_master" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Seconds behind master Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "seconds_behind_master",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-seconds_behind_master",
                    "severity" : 1,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-backup_storage_used" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical backup storage used Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "backup_storage_used",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-backup_storage_used",
                    "severity" : 0,
                    "threshold" : 500000,
                    "operator" : "LessThan",
                    "window_size" : "PT15M"
                },
                "High-backup_storage_used" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High backup storage used Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "backup_storage_used",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-backup_storage_used",
                    "severity" : 1,
                    "threshold" : 500000,
                    "operator" : "LessThan",
                    "window_size" : "PT15M"
                },
                "Critical-cpu_percent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical cpu percent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cpu_percent",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-cpu_percent",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-cpu_percent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High cpu percent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cpu_percent",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-cpu_percent",
                    "severity" : 1,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-io_consumption_percent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical io consumption percent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "io_consumption_percent",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-io_consumption_percent",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-io_consumption_percent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High io consumption percent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "io_consumption_percent",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-io_consumption_percent",
                    "severity" : 1,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-memory_percent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical memory percent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "memory_percent",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-memory_percent",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-memory_percent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High memory percent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "memory_percent",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-memory_percent",
                    "severity" : 1,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-serverlog_storage_percent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical serverlog storage percent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "serverlog_storage_percent",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-serverlog_storage_percent",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-serverlog_storage_percent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High serverlog storage percent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "serverlog_storage_percent",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-serverlog_storage_percent",
                    "severity" : 1,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-storage_percent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical storage percent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "storage_percent",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-storage_percent",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-storage_percent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High storage percent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "storage_percent",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-storage_percent",
                    "severity" : 1,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-active_connections" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical active connections Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "active_connections",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-active_connections",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-active_connections" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High active connections Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "active_connections",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-active_connections",
                    "severity" : 1,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-network_bytes_ingress" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical network bytes ingress Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "network_bytes_ingress",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-network_bytes_ingress",
                    "severity" : 0,
                    "threshold" : 10000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-network_bytes_ingress" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High network bytes ingress Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "network_bytes_ingress",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-network_bytes_ingress",
                    "severity" : 1,
                    "threshold" : 10000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-network_bytes_egress" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical network bytes egress Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "network_bytes_egress",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "Critical-network_bytes_egress",
                    "severity" : 0,
                    "threshold" : 10000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-network_bytes_egress" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High network bytes egress Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "network_bytes_egress",
                    "metric_namespace" : "Microsoft.DBforMySQL/servers",
                    "name" : "High-network_bytes_egress",
                    "severity" : 1,
                    "threshold" : 10000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.network/loadbalancers": {
            "alerts" : {
                "Critical-AllocatedSnatPorts" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Allocated Snat Ports Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "AllocatedSnatPorts",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "Critical-AllocatedSnatPorts",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-AllocatedSnatPorts" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Allocated Snat Ports Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "AllocatedSnatPorts",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "High-AllocatedSnatPorts",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-ByteCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Byte Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ByteCount",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "Critical-ByteCount",
                    "severity" : 0,
                    "threshold" : 50000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-ByteCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Byte Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ByteCount",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "High-ByteCount",
                    "severity" : 1,
                    "threshold" : 50000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-DipAvailability" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Health Probe Status Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DipAvailability",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "Critical-DipAvailability",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-DipAvailability" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Health Probe Status Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DipAvailability",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "High-DipAvailability",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-PacketCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Packet Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PacketCount",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "Critical-PacketCount",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-PacketCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Packet Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PacketCount",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "High-PacketCount",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-SnatConnectionCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical SNAT Connection Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SnatConnectionCount",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "Critical-SnatConnectionCount",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-SnatConnectionCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High SNAT Connection Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SnatConnectionCount",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "High-SnatConnectionCount",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-SYNCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical SYN Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SYNCount",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "Critical-SYNCount",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-SYNCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High SYN Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SYNCount",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "High-SYNCount",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-UsedSnatPorts" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Used Snat Ports Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "UsedSnatPorts",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "Critical-UsedSnatPorts",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-UsedSnatPorts" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Used Snat Ports Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "UsedSnatPorts",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "High-UsedSnatPorts",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-VipAvailability" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Vip Availability Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "VipAvailability",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "Critical-VipAvailability",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-VipAvailability" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Vip Availability Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "VipAvailability",
                    "metric_namespace" : "Microsoft.Network/loadBalancers",
                    "name" : "High-VipAvailability",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.keyvault/vaults": {
            "alerts" : {
                "Critical-Vaultrequestsavailability" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Vault requests availability Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Availability",
                    "metric_namespace" : "Microsoft.KeyVault/vaults",
                    "name" : "Critical-Vaultrequestsavailability",
                    "severity" : 0,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-Vaultrequestsavailability" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Vault requests availability Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Availability",
                    "metric_namespace" : "Microsoft.KeyVault/vaults",
                    "name" : "High-Vaultrequestsavailability",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-TotalServiceApiResults" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Number of total service api results Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ServiceApiResult",
                    "metric_namespace" : "Microsoft.KeyVault/vaults",
                    "name" : "Critical-TotalServiceApiResults",
                    "severity" : 0,
                    "threshold" : 1000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-TotalServiceApiResults" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Number of total service api results Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ServiceApiResult",
                    "metric_namespace" : "Microsoft.KeyVault/vaults",
                    "name" : "High-TotalServiceApiResults",
                    "severity" : 1,
                    "threshold" : 1000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.hdinsight/clusters": {
            "alerts" : {
                "Critical-GatewayRequests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Number of gateway requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "GatewayRequests",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-GatewayRequests",
                    "severity" : 0,
                    "threshold" : 1000000000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-GatewayRequests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Number of gateway requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "GatewayRequests",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-GatewayRequests",
                    "severity" : 1,
                    "threshold" : 1000000000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-RESTproxyConsumerRequestThroughput" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Number of consumer requests to Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ConsumerRequest.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-RESTproxyConsumerRequestThroughput",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-RESTproxyConsumerRequestThroughput" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Number of consumer requests to Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ConsumerRequest.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-RESTproxyConsumerRequestThroughput",
                    "severity" : 1,
                    "threshold" : 100,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-RESTproxyConsumerUnsuccessfulRequests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Consumer request exceptions Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ConsumerRequestFail.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-RESTproxyConsumerUnsuccessfulRequests",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-RESTproxyConsumerUnsuccessfulRequests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Consumer request exceptions Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ConsumerRequestFail.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-RESTproxyConsumerUnsuccessfulRequests",
                    "severity" : 1,
                    "threshold" : 100,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-RESTproxyConsumerRequestLatency" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Message latency in a consumer request through Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ConsumerRequestTime.p95",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-RESTproxyConsumerRequestLatency",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-RESTproxyConsumerRequestLatency" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a Message latency in a consumer request through Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ConsumerRequestTime.p95",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-RESTproxyConsumerRequestLatency",
                    "severity" : 1,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-RESTproxyProducerMessageThroughput" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Number of producer messages through Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.MessagesIn.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-RESTproxyProducerMessageThroughput",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-RESTproxyProducerMessageThroughput" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Number of producer messages through Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.MessagesIn.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-RESTproxyProducerMessageThroughput",
                    "severity" : 1,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-RESTproxyConsumerMessageThroughput" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Number of consumer messages through Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.MessagesOut.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-RESTproxyConsumerMessageThroughput",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-RESTproxyConsumerMessageThroughput" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Number of consumer messages through Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.MessagesOut.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-RESTproxyConsumerMessageThroughput",
                    "severity" : 1,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-RESTproxyConcurrentConnections" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Number of concurrent connections through Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.OpenConnections",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-RESTproxyConcurrentConnections",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-RESTproxyConcurrentConnections" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Number of concurrent connections through Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.OpenConnections",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-RESTproxyConcurrentConnections",
                    "severity" : 1,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-RESTproxyProducerRequestThroughput" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Number of producer requests to Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ProducerRequest.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-RESTproxyProducerRequestThroughput",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-RESTproxyProducerRequestThroughput" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Number of producer requests to Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ProducerRequest.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-RESTproxyProducerRequestThroughput",
                    "severity" : 1,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-RESTproxyProducerUnsuccessfulRequests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Producer request exceptions Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ProducerRequestFail.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-RESTproxyProducerUnsuccessfulRequests",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-RESTproxyProducerUnsuccessfulRequests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Producer request exceptions Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ProducerRequestFail.m1_delta",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-RESTproxyProducerUnsuccessfulRequests",
                    "severity" : 1,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-RESTproxyProducerRequestLatency" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Message latency in a producer request through Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ProducerRequestTime.p95",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-RESTproxyProducerRequestLatency",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-RESTproxyProducerRequestLatency" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a Message latency in a producer request through Kafka REST proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "KafkaRestProxy.ProducerRequestTime.p95",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-RESTproxyProducerRequestLatency",
                    "severity" : 1,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-NumberofActiveWorkers" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Number of Active Workers Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "NumActiveWorkers",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-NumberofActiveWorkers",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-NumberofActiveWorkers" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a Number of Active Workers Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "NumActiveWorkers",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-NumberofActiveWorkers",
                    "severity" : 1,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-PendingCPU" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Pending CPU Requests in YARN Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PendingCPU",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-PendingCPU",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-PendingCPU" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a Pending CPU Requests in YARN Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PendingCPU",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-PendingCPU",
                    "severity" : 1,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-PendingMemory" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Pending Memory Requests in YARN Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PendingMemory",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "Critical-PendingMemory",
                    "severity" : 0,
                    "threshold" : 1000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-PendingMemory" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a Pending Memory Requests in YARN Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PendingMemory",
                    "metric_namespace" : "Microsoft.HDInsight/clusters",
                    "name" : "High-PendingMemory",
                    "severity" : 1,
                    "threshold" : 1000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.network/dnszones": {
            "alerts" : {
                "Critical-QueryVolume" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Query Volume Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "QueryVolume",
                    "metric_namespace" : "Microsoft.Network/dnszones",
                    "name" : "Critical-QueryVolume",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "GreaterThan",
                    "window_size" : "PT1H"
                },
                "High-QueryVolume" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Query Volume Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "QueryVolume",
                    "metric_namespace" : "Microsoft.Network/dnszones",
                    "name" : "High-QueryVolume",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "GreaterThan",
                    "window_size" : "PT1H"
                },
                "Critical-RecordSetCount" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Record Set Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "RecordSetCount",
                    "metric_namespace" : "Microsoft.Network/dnszones",
                    "name" : "Critical-RecordSetCount",
                    "severity" : 0,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT1H"
                },
                "High-RecordSetCount" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Record Set Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "RecordSetCount",
                    "metric_namespace" : "Microsoft.Network/dnszones",
                    "name" : "High-RecordSetCount",
                    "severity" : 1,
                    "threshold" : 100,
                    "operator" : "GreaterThan",
                    "window_size" : "PT1H"
                },
                "Critical-RecordSetCapacityUtilization" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Record Set Capacity Utilization Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "RecordSetCapacityUtilization",
                    "metric_namespace" : "Microsoft.Network/dnszones",
                    "name" : "Critical-RecordSetCapacityUtilization",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT1H"
                },
                "High-RecordSetCapacityUtilization" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High Record Set Capacity Utilization Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "RecordSetCapacityUtilization",
                    "metric_namespace" : "Microsoft.Network/dnszones",
                    "name" : "High-RecordSetCapacityUtilization",
                    "severity" : 1,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT1H"
                }
            }
        },
        "microsoft.containerservice/managedclusters": {
            "alerts" : {
                "Critical-cluster_autoscaler_cluster_safe_to_autoscale" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Cluster Health Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cluster_autoscaler_cluster_safe_to_autoscale",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-cluster_autoscaler_cluster_safe_to_autoscale",
                    "severity" : 0,
                    "threshold" : 5,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-cluster_autoscaler_cluster_safe_to_autoscale" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Cluster Health Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cluster_autoscaler_cluster_safe_to_autoscale",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-cluster_autoscaler_cluster_safe_to_autoscale",
                    "severity" : 1,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-cluster_autoscaler_unneeded_nodes_count" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Unneeded Nodes Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cluster_autoscaler_unneeded_nodes_count",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-cluster_autoscaler_unneeded_nodes_count",
                    "severity" : 0,
                    "threshold" : 5,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-cluster_autoscaler_unneeded_nodes_count" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Unneeded Nodes Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cluster_autoscaler_unneeded_nodes_count",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-cluster_autoscaler_unneeded_nodes_count",
                    "severity" : 1,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-cluster_autoscaler_unschedulable_pods_count" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Unschedulable Pods Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cluster_autoscaler_unschedulable_pods_count",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-cluster_autoscaler_unschedulable_pods_count",
                    "severity" : 0,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-cluster_autoscaler_unschedulable_pods_count" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Unschedulable Pods Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "cluster_autoscaler_unschedulable_pods_count",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-cluster_autoscaler_unschedulable_pods_count",
                    "severity" : 1,
                    "threshold" : 3,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-node_cpu_usage_percentage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical CPU Usage Percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_cpu_usage_percentage",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-node_cpu_usage_percentage",
                    "severity" : 0,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-node_cpu_usage_percentage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High CPU Usage Percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_cpu_usage_percentage",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-node_cpu_usage_percentage",
                    "severity" : 1,
                    "threshold" : 3,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-node_disk_usage_percentage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Disk Used Percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_disk_usage_percentage",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-node_disk_usage_percentage",
                    "severity" : 0,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-node_disk_usage_percentage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Disk Used Percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_disk_usage_percentage",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-node_disk_usage_percentage",
                    "severity" : 1,
                    "threshold" : 3,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-node_memory_rss_percentage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Memory RSS Percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_memory_rss_percentage",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-node_memory_rss_percentage",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-node_memory_rss_percentage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Memory RSS Percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_memory_rss_percentage",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-node_memory_rss_percentage",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-node_memory_working_set_percentage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Memory Working Set Percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_memory_working_set_percentage",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-node_memory_working_set_percentage",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-node_memory_working_set_percentage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Memory Working Set Percentage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_memory_working_set_percentage",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-node_memory_working_set_percentage",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-node_network_in_bytes" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Network In Bytes Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_network_in_bytes",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-node_network_in_bytes",
                    "severity" : 0,
                    "threshold" : 50000000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-node_network_in_bytes" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Network In Bytes Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_network_in_bytes",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-node_network_in_bytes",
                    "severity" : 1,
                    "threshold" : 70000000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-node_network_out_bytes" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Network Out Bytes Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_network_out_bytes",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-node_network_out_bytes",
                    "severity" : 0,
                    "threshold" : 50000000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-node_network_out_bytes" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Network Out Bytes Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "node_network_out_bytes",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-node_network_out_bytes",
                    "severity" : 1,
                    "threshold" : 70000000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-kube_pod_status_phase" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Number of pods by phase Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "kube_pod_status_phase",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-kube_pod_status_phase",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-kube_pod_status_phase" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Number of pods by phase Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "kube_pod_status_phase",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-kube_pod_status_phase",
                    "severity" : 1,
                    "threshold" : 70,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-kube_pod_status_ready" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Number of pods in Ready state Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "kube_pod_status_ready",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "Critical-kube_pod_status_ready",
                    "severity" : 0,
                    "threshold" : 5,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-kube_pod_status_ready" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Number of pods in Ready state Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "kube_pod_status_ready",
                    "metric_namespace" : "Microsoft.ContainerService/managedClusters",
                    "name" : "High-kube_pod_status_ready",
                    "severity" : 1,
                    "threshold" : 7,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.containerregistry/registries": {
            "alerts" : {
                "Critical-StorageUsed" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Storage Used Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "StorageUsed",
                    "metric_namespace" : "Microsoft.ContainerRegistry/registries",
                    "name" : "Critical-StorageUsed",
                    "severity" : 0,
                    "threshold" : 500000000,
                    "operator" : "LessThan",
                    "window_size" : "PT1H"
                },
                "High-StorageUsed" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Storage Used Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "StorageUsed",
                    "metric_namespace" : "Microsoft.ContainerRegistry/registries",
                    "name" : "High-StorageUsed",
                    "severity" : 1,
                    "threshold" : 100000000,
                    "operator" : "LessThan",
                    "window_size" : "PT1H"
                },
                "Critical-SuccessfulPullCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Successful Pull Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SuccessfulPullCount",
                    "metric_namespace" : "Microsoft.ContainerRegistry/registries",
                    "name" : "Critical-SuccessfulPullCount",
                    "severity" : 0,
                    "threshold" : 5000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-SuccessfulPullCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Successful Pull Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SuccessfulPullCount",
                    "metric_namespace" : "Microsoft.ContainerRegistry/registries",
                    "name" : "High-SuccessfulPullCount",
                    "severity" : 1,
                    "threshold" : 1000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-SuccessfulPushCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Successful Push Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SuccessfulPushCount",
                    "metric_namespace" : "Microsoft.ContainerRegistry/registries",
                    "name" : "Critical-SuccessfulPushCount",
                    "severity" : 0,
                    "threshold" : 5000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-SuccessfulPushCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Successful Push Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SuccessfulPushCount",
                    "metric_namespace" : "Microsoft.ContainerRegistry/registries",
                    "name" : "High-SuccessfulPushCount",
                    "severity" : 1,
                    "threshold" : 1000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-TotalPullCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Total Pull Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TotalPullCount",
                    "metric_namespace" : "Microsoft.ContainerRegistry/registries",
                    "name" : "Critical-TotalPullCount",
                    "severity" : 0,
                    "threshold" : 5000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-TotalPullCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Total Pull Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TotalPullCount",
                    "metric_namespace" : "Microsoft.ContainerRegistry/registries",
                    "name" : "High-TotalPullCount",
                    "severity" : 1,
                    "threshold" : 1000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-TotalPushCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Total Push Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TotalPushCount",
                    "metric_namespace" : "Microsoft.ContainerRegistry/registries",
                    "name" : "Critical-TotalPushCount",
                    "severity" : 0,
                    "threshold" : 5000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-TotalPushCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Total Push Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TotalPushCount",
                    "metric_namespace" : "Microsoft.ContainerRegistry/registries",
                    "name" : "High-TotalPushCount",
                    "severity" : 1,
                    "threshold" : 1000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.cdn/profiles": {
            "alerts" : {
                "Critical-ByteHitRatio" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a ratio of the total bytes served from the cache compared to the total response bytes Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ByteHitRatio",
                    "metric_namespace" : "Microsoft.Cdn/profiles",
                    "name" : "Critical-ByteHitRatio",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-ByteHitRatio" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a ratio of the total bytes served from the cache compared to the total response bytes Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ByteHitRatio",
                    "metric_namespace" : "Microsoft.Cdn/profiles",
                    "name" : "High-ByteHitRatio",
                    "severity" : 1,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-RequestCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a number of client requests served by the HTTP/S proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "RequestCount",
                    "metric_namespace" : "Microsoft.Cdn/profiles",
                    "name" : "Critical-RequestCount",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-RequestCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a number of client requests served by the HTTP/S proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "RequestCount",
                    "metric_namespace" : "Microsoft.Cdn/profiles",
                    "name" : "High-RequestCount",
                    "severity" : 1,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-ResponseSize" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a number of bytes sent as responses from HTTP/S proxy to clients Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ResponseSize",
                    "metric_namespace" : "Microsoft.Cdn/profiles",
                    "name" : "Critical-ResponseSize",
                    "severity" : 0,
                    "threshold" : 1000000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-ResponseSize" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a number of bytes sent as responses from HTTP/S proxy to clients Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ResponseSize",
                    "metric_namespace" : "Microsoft.Cdn/profiles",
                    "name" : "Response Size",
                    "severity" : 1,
                    "threshold" : 1000000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-TotalLatency" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a time calculated from when the client request was received by the HTTP/S proxy until the client acknowledged the last response byte from the HTTP/S proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TotalLatency",
                    "metric_namespace" : "Microsoft.Cdn/profiles",
                    "name" : "Critical-TotalLatency",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-TotalLatency" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a time calculated from when the client request was received by the HTTP/S proxy until the client acknowledged the last response byte from the HTTP/S proxy Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TotalLatency",
                    "metric_namespace" : "Microsoft.Cdn/profiles",
                    "name" : "High-TotalLatency",
                    "severity" : 1,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.documentdb/databaseaccounts": {
            "alerts" : {
                "Critical-CreateAccount" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Create Account Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "CreateAccount",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-CreateAccount",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-CreateAccount" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High  Create Account Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "CreateAccount",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-CreateAccount",
                    "severity" : 1,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-DeleteAccount" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Delete Account Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DeleteAccount",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-DeleteAccount",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-DeleteAccount" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Delete Account Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DeleteAccount",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-DeleteAccount",
                    "severity" : 1,
                    "threshold" : 7,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-AutoscaleMaxThroughput" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical Autoscale Max Throughput Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "AutoscaleMaxThroughput",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-AutoscaleMaxThroughput",
                    "severity" : 0,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-AutoscaleMaxThroughput" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High  Autoscale Max Throughput Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "AutoscaleMaxThroughput",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-AutoscaleMaxThroughput",
                    "severity" : 1,
                    "threshold" : 1,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-DataUsage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Data Usage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DataUsage",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-DataUsage",
                    "severity" : 0,
                    "threshold" : 100000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-DataUsage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High  Data Usage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DataUsage",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-DataUsage",
                    "severity" : 1,
                    "threshold" : 50000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-DedicatedGatewayAverageCPUUsage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Dedicated Gateway Average CPU Usage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DedicatedGatewayAverageCPUUsage",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-DedicatedGatewayAverageCPUUsage",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-DedicatedGatewayAverageCPUUsage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Dedicated Gateway Average CPU Usage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DedicatedGatewayAverageCPUUsage",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-DedicatedGatewayAverageCPUUsage",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-DedicatedGatewayAverageMemoryUsage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Dedicated Gateway Average Memory Usage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DedicatedGatewayAverageMemoryUsage",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-DedicatedGatewayAverageMemoryUsage",
                    "severity" : 0,
                    "threshold" : 100000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-DedicatedGatewayAverageMemoryUsage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Dedicated Gateway Average Memory Usage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DedicatedGatewayAverageMemoryUsage",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-DedicatedGatewayAverageMemoryUsage",
                    "severity" : 1,
                    "threshold" : 50000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-DedicatedGatewayMaximumCPUUsage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Dedicated Gateway Maximum CPU Usage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DedicatedGatewayMaximumCPUUsage",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-DedicatedGatewayMaximumCPUUsage",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-DedicatedGatewayMaximumCPUUsage" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Dedicated Gateway Maximum CPU Usage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DedicatedGatewayMaximumCPUUsage",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-DedicatedGatewayMaximumCPUUsage",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-DedicatedGatewayRequests" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Dedicated Gateway Requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DedicatedGatewayRequests",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-DedicatedGatewayRequests",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-DedicatedGatewayRequests" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Dedicated Gateway Requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DedicatedGatewayRequests",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-DedicatedGatewayRequests",
                    "severity" : 1,
                    "threshold" : 400,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-DocumentCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Document Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DocumentCount",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-DocumentCount",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-DocumentCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Document Count Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DocumentCount",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-DocumentCount",
                    "severity" : 1,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-DocumentQuota" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Document Quota Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DocumentQuota",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-DocumentQuota",
                    "severity" : 0,
                    "threshold" : 10000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-DocumentQuota" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Document Quota Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DocumentQuota",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-DocumentQuota",
                    "severity" : 1,
                    "threshold" : 5000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-GremlinDatabaseCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Gremlin Database Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "GremlinDatabaseCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-GremlinDatabaseCreate",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-GremlinDatabaseCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Gremlin Database Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "GremlinDatabaseCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-GremlinDatabaseCreate",
                    "severity" : 1,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-GremlinDatabaseDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Gremlin Database Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "GremlinDatabaseDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-GremlinDatabaseDelete",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-GremlinDatabaseDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Gremlin Database Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "GremlinDatabaseDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-GremlinDatabaseDelete",
                    "severity" : 1,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-GremlinGraphCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Gremlin Graph Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "GremlinGraphCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-GremlinGraphCreate",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-GremlinGraphCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Gremlin Graph Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "GremlinGraphCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-GremlinGraphCreate",
                    "severity" : 1,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-GremlinGraphDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Gremlin Graph Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "GremlinGraphDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-GremlinGraphDelete",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-GremlinGraphDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Gremlin Graph Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "GremlinGraphDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-GremlinGraphCreate",
                    "severity" : 1,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-IndexUsage" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Index Usage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "IndexUsage",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-IndexUsage",
                    "severity" : 0,
                    "threshold" : 100000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-IndexUsage" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Index Usage Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "IndexUsage",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-IndexUsage",
                    "severity" : 1,
                    "threshold" : 50000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-IntegratedCacheItemHitRate" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Integrated Cache Item Hit Rate Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "IntegratedCacheItemHitRate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-IntegratedCacheItemHitRate",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-IntegratedCacheItemHitRate" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Integrated Cache Item Hit Rate Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "IntegratedCacheItemHitRate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-IntegratedCacheItemHitRate",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-IntegratedCacheQueryHitRate" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Integrated Cache Query Hit Rate Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "IntegratedCacheQueryHitRate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-IntegratedCacheQueryHitRate",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-IntegratedCacheQueryHitRate" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Integrated Cache Query Hit Rate Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "IntegratedCacheQueryHitRate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-IntegratedCacheQueryHitRate",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-MongoCollectionCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Mongo Collection Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoCollectionCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-MongoCollectionCreate",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-MongoCollectionCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a High Mongo Collection Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoCollectionCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-MongoCollectionCreate",
                    "severity" : 1,
                    "threshold" : 400,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-MongoCollectionDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Mongo Collection Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoCollectionDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-MongoCollectionDelete",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-MongoCollectionDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a High Mongo Collection Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoCollectionDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-MongoCollectionDelete",
                    "severity" : 1,
                    "threshold" : 400,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-MongoDatabaseDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Mongo Database Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoDatabaseDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-MongoDatabaseDelete",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-MongoDatabaseDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a High Mongo Database Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoDatabaseDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-MongoDatabaseDelete",
                    "severity" : 1,
                    "threshold" : 7,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-MongoDBDatabaseCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical MongoDB Database Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoDBDatabaseCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-MongoDBDatabaseCreate",
                    "severity" : 0,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-MongoDBDatabaseCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a High MongoDB Database Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoDBDatabaseCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-MongoDBDatabaseCreate",
                    "severity" : 1,
                    "threshold" : 3,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-MongoRequestCharge" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Mongo Request Charge Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoRequestCharge",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-MongoRequestCharge",
                    "severity" : 0,
                    "threshold" : 5,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-MongoRequestCharge" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a High Mongo Request Charge Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoRequestCharge",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-MongoRequestCharge",
                    "severity" : 1,
                    "threshold" : 3,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-MongoRequests" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Mongo Requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoRequests",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-MongoRequests",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-MongoRequests" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a High Mongo Requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "MongoRequests",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-MongoRequests",
                    "severity" : 1,
                    "threshold" : 40,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-RegionFailover" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Region Failover Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "RegionFailover",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-RegionFailover",
                    "severity" : 0,
                    "threshold" : 5,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-RegionFailover" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Region Failover Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "RegionFailover",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-RegionFailover",
                    "severity" : 1,
                    "threshold" : 10,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-ReplicationLatency" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Replication Latency Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ReplicationLatency",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-ReplicationLatency",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-ReplicationLatency" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Replication Latency Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ReplicationLatency",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-ReplicationLatency",
                    "severity" : 1,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-ServerSideLatency" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Server Side Latency Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ServerSideLatency",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-ServerSideLatency",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-ServerSideLatency" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Server Side Latency Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ServerSideLatency",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-ServerSideLatency",
                    "severity" : 1,
                    "threshold" : 50,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-ServiceAvailability" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Service Availability Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ServiceAvailability",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-ServiceAvailability",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT1H"
                },
                "High-ServiceAvailability" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Service Availability Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ServiceAvailability",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-ServiceAvailability",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT1H"
                },
                "Critical-SqlContainerCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Sql Container Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SqlContainerCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-SqlContainerCreate",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-SqlContainerCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Sql Container Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SqlContainerCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-SqlContainerCreate",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-SqlContainerDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Sql Container Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SqlContainerDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-SqlContainerDelete",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-SqlContainerDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Sql Container Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SqlContainerDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-SqlContainerDelete",
                    "severity" : 1,
                    "threshold" : 8,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-SqlDatabaseCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Sql Database Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SqlDatabaseCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-SqlDatabaseCreate",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-SqlDatabaseCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Sql Database Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SqlDatabaseCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-SqlDatabaseCreate",
                    "severity" : 1,
                    "threshold" : 8,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-SqlDatabaseDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Sql Database Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SqlDatabaseDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-SqlDatabaseDelete",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-SqlDatabaseDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Sql Database Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SqlDatabaseDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-SqlDatabaseDelete",
                    "severity" : 1,
                    "threshold" : 8,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-SqlDatabaseUpdate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Sql Database Update Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SqlDatabaseUpdate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-SqlDatabaseUpdate",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-SqlDatabaseUpdate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Sql Database Update Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SqlDatabaseUpdate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-SqlDatabaseUpdate",
                    "severity" : 1,
                    "threshold" : 8,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-TableTableCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Table Table Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TableTableCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-TableTableCreate",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-TableTableCreate" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Table Table Create Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TableTableCreate",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-TableTableCreate",
                    "severity" : 1,
                    "threshold" : 8,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-TableTableDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Table Table Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TableTableDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-TableTableDelete",
                    "severity" : 0,
                    "threshold" : 10,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-TableTableDelete" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Table Table Delete Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TableTableDelete",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-TableTableDelete",
                    "severity" : 1,
                    "threshold" : 8,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-TotalRequests" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : true,
                    "description" : "This is a Critical Total Requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TotalRequests",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "Critical-TotalRequests",
                    "severity" : 0,
                    "threshold" : 1000,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-TotalRequests" : {
                    
                    "aggregation" :  "Count",
                    "critical_alert" : false,
                    "description" : "This is a High Total Requests Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "TotalRequests",
                    "metric_namespace" : "Microsoft.DocumentDB/DatabaseAccounts",
                    "name" : "High-TotalRequests",
                    "severity" : 1,
                    "threshold" : 800,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.network/azurefirewalls":{
            "alerts" : {
                "Critical-ApplicationRuleHit" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Application Rule Hit Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ApplicationRuleHit",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "Critical-ApplicationRuleHit",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-ApplicationRuleHit" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Application Rule Hit Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ApplicationRuleHit",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "High-ApplicationRuleHit",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-DataProcessed" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Data processed Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DataProcessed",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "Critical-DataProcessed",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-DataProcessed" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Data processed Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "DataProcessed",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "High-DataProcessed",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-FirewallHealth" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Firewall Health Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "FirewallHealth",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "Critical-FirewallHealth",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-FirewallHealth" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Firewall Health Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "FirewallHealth",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "High-FirewallHealth",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-NetworkRuleHit" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Network Rule Hit Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "NetworkRuleHit",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "Critical-NetworkRuleHit",
                    "severity" : 0,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-NetworkRuleHit" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Network Rule Hit Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "NetworkRuleHit",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "High-NetworkRuleHit",
                    "severity" : 1,
                    "threshold" : 500,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-SNATPortUtilization" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical SNAT Port Utilization Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SNATPortUtilization",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "Critical-SNATPortUtilization",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-SNATPortUtilization" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High SNAT Port Utilization Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "SNATPortUtilization",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "High-SNATPortUtilization",
                    "severity" : 1,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-Throughput" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Throughput Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Throughput",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "Critical-Throughput",
                    "severity" : 0,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-Throughput" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Throughput Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Throughput",
                    "metric_namespace" : "Microsoft.Network/azurefirewalls",
                    "name" : "High-Throughput",
                    "severity" : 1,
                    "threshold" : 50,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.network/applicationgateways": {
            "alerts" : {
                "Critical-BackendFirstByteResponseTime" : {
                
                "aggregation" :  "Average",
                "critical_alert" : true,
                "description" : "This is a Backend First Byte Response Time Alert",
                "frequency" : "PT1M",
                "metric_name" : "BackendFirstByteResponseTime",
                "metric_namespace" : "Microsoft.Network/applicationgateways",
                "name" : "Critical-BackendFirstByteResponseTime",
                "severity" : 0,
                "threshold" : 60,
                "operator" : "GreaterThan",
                "window_size" : "PT5M"
                },
                "High-BackendFirstByteResponseTime" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a Backend First Byte Response Time Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "BackendFirstByteResponseTime",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-BackendFirstByteResponseTime",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-BackendLastByteResponseTime" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Backend Last Byte Response Time Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "BackendLastByteResponseTime",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "Critical-BackendLastByteResponseTime",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-BackendLastByteResponseTime" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a Backend Last Byte Response Time Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "BackendLastByteResponseTime",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-BackendLastByteResponseTime",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-BackendResponseStatus" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Backend Response Status Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "BackendResponseStatus",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "Critical-BackendResponseStatus",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-BackendResponseStatus" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Backend Response Status Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "BackendResponseStatus",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-BackendResponseStatus",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-BytesReceived" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a total number of bytes received by the Application Gateway from the clients Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "BytesReceived",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "Critical-BytesReceived",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-BytesReceived" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a total number of bytes received by the Application Gateway from the clients Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "BytesReceived",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-BytesReceived",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-BytesSent" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a total number of bytes sent by the Application Gateway to the clients Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "BytesSent",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "Critical-BytesSent",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-BytesSent" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a total number of bytes sent by the Application Gateway to the clients Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "BytesSent",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-BytesSent",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-FailedRequests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Count of failed requests that Application Gateway has served Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "FailedRequests",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "Critical-FailedRequests",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-FailedRequests" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Count of failed requests that Application Gateway has served Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "FailedRequests",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-FailedRequests",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-HealthyHostCount" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Number of healthy backend hosts Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "HealthyHostCount",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "Critical-HealthyHostCount",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-HealthyHostCount" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a Number of healthy backend hosts Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "HealthyHostCount",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-HealthyHostCount",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-RequestsperminuteperHealthyHost" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Average request count per minute per healthy backend host in a pool Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "AvgRequestCountPerHealthyHost",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "Critical-RequestsperminuteperHealthyHost",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-RequestsperminuteperHealthyHost" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a Average request count per minute per healthy backend host in a pool Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "AvgRequestCountPerHealthyHost",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-RequestsperminuteperHealthyHost",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-ResponseStatus" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Http response status returned by Application Gateway Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ResponseStatus",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "Critical-ResponseStatus",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-ResponseStatus" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Http response status returned by Application Gateway Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "ResponseStatus",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-ResponseStatus",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-Throughput" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Number of bytes per second the Application Gateway has served Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Throughput",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "Critical-Throughput",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-Throughput" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a Number of bytes per second the Application Gateway has served Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Throughput",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-Throughput",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-UnhealthyHostCount" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Number of unhealthy backend hosts Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "UnhealthyHostCount",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "Critical-UnhealthyHostCount",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-UnhealthyHostCount" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a Number of unhealthy backend hosts Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "UnhealthyHostCount",
                    "metric_namespace" : "Microsoft.Network/applicationgateways",
                    "name" : "High-UnhealthyHostCount",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-PacketCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Total number of Packets transmitted within time period Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PacketCount",
                    "metric_namespace" : "Microsoft.Network/applicationGateways",
                    "name" : "Critical-PacketCount",
                    "severity" : 0,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-PacketCount" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a Total number of Packets transmitted within time period Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PacketCount",
                    "metric_namespace" : "Microsoft.Network/applicationGateways",
                    "name" : "High-PacketCount",
                    "severity" : 1,
                    "threshold" : 60,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.compute/virtualmachines" : {
            "alerts" : {
                "Critical-MemoryAlert" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Memory Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Available Memory Bytes",
                    "metric_namespace" : "Microsoft.Compute/virtualMachines",
                    "name" : "Critical-MemoryAlert",
                    "severity" : 0,
                    "threshold" : 500000000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "High-MemoryAlert" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Memory Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Available Memory Bytes",
                    "metric_namespace" : "Microsoft.Compute/virtualMachines",
                    "name" : "High-MemoryAlert",
                    "severity" : 1,
                    "threshold" : 1000000000,
                    "operator" : "LessThan",
                    "window_size" : "PT5M"
                },
                "Critical-CPUAlert" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical CPU Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Percentage CPU",
                    "metric_namespace" : "Microsoft.Compute/virtualMachines",
                    "name" : "Critical-CPUAlert",
                    "severity" : 0,
                    "threshold" : 92,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-CPUAlert" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High CPU Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Percentage CPU",
                    "metric_namespace" : "Microsoft.Compute/virtualMachines",
                    "name" : "High-CPUAlert",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-NetworkIn" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : true,
                    "description" : "This is a Critical Network In Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Network In",
                    "metric_namespace" : "Microsoft.Compute/virtualMachines",
                    "name" : "Critical-NetworkIn",
                    "severity" : 0,
                    "threshold" : 92,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-NetworkIn" : {
                    
                    "aggregation" :  "Total",
                    "critical_alert" : false,
                    "description" : "This is a High Network In Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "Network In",
                    "metric_namespace" : "Microsoft.Compute/virtualMachines",
                    "name" : "High-NetworkIn",
                    "severity" : 1,
                    "threshold" : 80,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                }
            }
        },
        "microsoft.network/virtualnetworks": {
            "alerts" : {
                "Critical-IfUnderDDoSAttack" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : true,
                    "description" : "This is a Critical If Under DDoS Attack Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "IfUnderDDoSAttack",
                    "metric_namespace" : "Microsoft.Network/virtualNetworks",
                    "name" : "Critical-IfUnderDDoSAttack",
                    "severity" : 0,
                    "threshold" : 300,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-IfUnderDDoSAttack" : {
                    
                    "aggregation" :  "Maximum",
                    "critical_alert" : false,
                    "description" : "This is a High If Under DDoS Attack Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "IfUnderDDoSAttack",
                    "metric_namespace" : "Microsoft.Network/virtualNetworks",
                    "name" : "High-IfUnderDDoSAttack",
                    "severity" : 1,
                    "threshold" : 300,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-PingMeshAverageRoundtripMs" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical Ping Mesh Average Round trip Ms Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PingMeshAverageRoundtripMs",
                    "metric_namespace" : "Microsoft.Network/virtualNetworks",
                    "name" : "Critical-PingMeshAverageRoundtripMs",
                    "severity" : 0,
                    "threshold" : 300,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-PingMeshAverageRoundtripMs" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High Ping Mesh Average Round trip Ms Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PingMeshAverageRoundtripMs",
                    "metric_namespace" : "Microsoft.Network/virtualNetworks",
                    "name" : "High-PingMeshAverageRoundtripMs",
                    "severity" : 1,
                    "threshold" : 300,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "Critical-PingMeshProbesFailedPercent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : true,
                    "description" : "This is a Critical PingMeshProbesFailedPercent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PingMeshProbesFailedPercent",
                    "metric_namespace" : "Microsoft.Network/virtualNetworks",
                    "name" : "Critical-PingMeshProbesFailedPercent",
                    "severity" : 0,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                },
                "High-PingMeshProbesFailedPercent" : {
                    
                    "aggregation" :  "Average",
                    "critical_alert" : false,
                    "description" : "This is a High PingMeshProbesFailedPercent Alert",
                    "frequency" : "PT1M",
                    "metric_name" : "PingMeshProbesFailedPercent",
                    "metric_namespace" : "Microsoft.Network/virtualNetworks",
                    "name" : "High-PingMeshProbesFailedPercent",
                    "severity" : 1,
                    "threshold" : 90,
                    "operator" : "GreaterThan",
                    "window_size" : "PT5M"
                }
            }
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

    #virtual_networks = [ for resource in data.azurerm_resources.virtual_networks.resources : lower(resource.id) ]
    #virtual_machines = [ for resource in data.azurerm_resources.virtual_machines.resources : lower(resource.id) ]
    #resource_id_list_compiled = toset(concat(local.virtual_machines, local.virtual_networks))
 
    resource_id_list_compiled = toset( [ for resource in concat(
        #data.azurerm_resources.virtual_networks.resources, 
        #data.azurerm_resources.virtual_machines.resources,
        #data.azurerm_resources.application_gateways.resources,
        #data.azurerm_resources.firewalls.resources,
        data.azurerm_resources.document_db.resources,
        #data.azurerm_resources.cdn_profiles.resources,
        #data.azurerm_resources.container_registries.resources,
        data.azurerm_resources.managed_clusters.resources,
        #data.azurerm_resources.dns_zones.resources,
        #data.azurerm_resources.hdinsights_clusters.resources,
        #data.azurerm_resources.keyvaults.resources,
        #data.azurerm_resources.load_balancers.resources,
        data.azurerm_resources.mysql_servers.resources,
        #data.azurerm_resources.notification_hubs.resources,
        #data.azurerm_resources.redis_caches.resources,
        #data.azurerm_resources.storage_accounts.resources
        ): lower(resource.id) ])
        

}

module "monitor_metric_alert" {
    #for_each = toset(local.virtual_machines)
    for_each = local.resource_id_list_compiled
    #for_each = var.resource_id_list
    source = "../monitor_metric_alert"
    resource_group_name = var.resource_group_name
    resource_id = each.key
    #alerts = try(var.resource_type_alerts[lower(local.resource_types[each.key])].alerts , null )
    alerts = var.resource_type_alerts[lower(local.resource_types[each.key])].alerts
}
