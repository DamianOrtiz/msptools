variable "resource_id"{
    type = string
    default = "/subscriptions/df510064-1312-4116-9944-0b6d03942270/resourceGroups/Jeremiah-Terraform/providers/Microsoft.Network/applicationGateways/jeremiah-terraform-appgw"
}
variable "resource_group_name"{
    type = string
    default = "fourkites-development"
}
variable "crtical_webhook" {
    type = list(string)
    default = ["https://hooks.slack.com/services/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"]
}
variable "high_webhook" {
    type = list(string)
    default = ["https://hooks.slack.com/services/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"]
}