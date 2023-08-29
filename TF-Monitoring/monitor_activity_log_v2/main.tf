
resource "azurerm_monitor_activity_log_alert" "critical" {

  name                = format("%s-%s", "Activity-Log-Critical-Alert", random_string.random_6.result)
  resource_group_name = var.resource_group_name
  scopes              = [var.resource_id]
  description         = "This alert will monitor for critical events."

  criteria {
    resource_id    = var.resource_id
    level          = "Critical"
    category       = "Administrative"
  }

  action {
      action_group_id = azurerm_monitor_action_group.critical_action_group_alert.id 
  }
}

resource "azurerm_monitor_activity_log_alert" "error" {

  name                = format("%s-%s", "Activity-Log-Error-Alert", random_string.random_6.result)
  resource_group_name = var.resource_group_name
  scopes              = [var.resource_id]
  description         = "This alert will monitor for error events"

  criteria {
    resource_id    = var.resource_id
    level          = "Error"
    category       = "Administrative"
  }

  action {
      action_group_id = azurerm_monitor_action_group.high_action_group_alert.id
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