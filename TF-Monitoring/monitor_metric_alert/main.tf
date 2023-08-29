resource "azurerm_monitor_metric_alert" "main" {
    for_each = var.alerts

  name                = format("%s-%s", each.value.name, random_string.random_6.result)
  resource_group_name = var.resource_group_name
  scopes              = [var.resource_id]
  description         = each.value.description 
  severity            = each.value.severity
  window_size         = each.value.window_size
  frequency           = each.value.frequency

  criteria {
    metric_namespace = each.value.metric_namespace
    metric_name      = each.value.metric_name
    aggregation      = each.value.aggregation
    operator         = each.value.operator
    threshold        = each.value.threshold

  }
  dynamic "action" {
      for_each = each.value.severity == 0 || each.value.severity == 1 ?  [0]  : []

    content {
        ######## need to work on redifining this
        action_group_id = each.value.severity == 0 ? azurerm_monitor_action_group.critical_action_group_alert.id : azurerm_monitor_action_group.high_action_group_alert.id
    }
  }
}

resource "random_string" "random_6" {
    length           = 6
    special          = true
    override_special = "_-"
}

resource "azurerm_monitor_action_group" "high_action_group_alert" {
  name                = "action-group-high-alert-${random_string.random_6.result}"
  resource_group_name = var.resource_group_name
  short_name          = "ag-tf-${random_string.random_6.result}"

  dynamic "webhook_receiver" {
      for_each = var.high_webhook
    content {
        name                    = webhook_receiver.value
        service_uri             = webhook_receiver.value
        use_common_alert_schema = true
    }
  }
}

resource "azurerm_monitor_action_group" "critical_action_group_alert" {
  name                = "action-group-critical-alert-${random_string.random_6.result}"
  resource_group_name = var.resource_group_name
  short_name          = "ag-tf-${random_string.random_6.result}"

  dynamic "webhook_receiver" {
      for_each = var.crtical_webhook
    content {
        name                    = webhook_receiver.value
        service_uri             = webhook_receiver.value
        use_common_alert_schema = true
    }
  }
}