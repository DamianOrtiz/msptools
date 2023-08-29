variable "alerts" {
   type = map(
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
}
variable "resource_id"{
    type = string
}
variable "resource_group_name"{
    type = string
}
variable "crtical_webhook" {
    type = list(string)
    default = ["https://example.jeremiah.com/critical"]
}
variable "high_webhook" {
    type = list(string)
    default = ["https://example.jeremiah.com/high"]
}