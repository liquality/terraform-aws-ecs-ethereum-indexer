# ------------------------------------------------------------------------------
# route53 settings
# ------------------------------------------------------------------------------
variable "route53_zone_name" {
  type        = string
  description = "Set the name of the route53 hosted zone"
  default     = "api.liq-chainhub.net"
}

variable "route53_record_name" {
  type        = string
  description = "Set the name of the route53 Alias record"
}
