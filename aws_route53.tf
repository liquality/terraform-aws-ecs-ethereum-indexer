# ------------------------------------------------------------------------------
# AWS route53 alias recored 
# ------------------------------------------------------------------------------
data "aws_route53_zone" "api" {
  name         = var.route53_zone_name
  private_zone = false
}

resource "aws_route53_record" "api" {
  zone_id = data.aws_route53_zone.api.zone_id
  name    = var.route53_record_name
  type    = "A"

  alias {
    name                   = aws_alb.api.dns_name
    zone_id                = aws_alb.api.zone_id
    evaluate_target_health = true
  }
}
