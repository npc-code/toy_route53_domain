resource "aws_route53_zone" "main_zone" {
  name = var.domain_name
  force_destroy = true
}

#maybe move this to another module?

#resource "aws_acm_certificate" "cert_request" {
#  domain_name               = var.domain_name
#  subject_alternative_names = ["*.${var.domain_name}"]
#  validation_method         = "DNS"

#  tags = {
#    Name : var.domain_name
#  }

#  lifecycle {
#    create_before_destroy = true
#  }
#}

#resource "aws_route53_record" "validation_record" {
#  for_each = {
#    for dvo in aws_acm_certificate.cert_request.domain_validation_options : dvo.domain_name => {
#      name   = dvo.resource_record_name
#      record = dvo.resource_record_value
#      type   = dvo.resource_record_type
#    }
#  }

#  allow_overwrite = true
#  name            = each.value.name
#  records         = [each.value.record]
#  ttl             = var.ttl
#  type            = each.value.type
#  zone_id         = aws_route53_zone.main_zone.zone_id
#}

#resource "aws_acm_certificate_validation" "certificate_validation" {
#  certificate_arn         = aws_acm_certificate.cert_request.arn
#  validation_record_fqdns = [for record in aws_route53_record.validation_record : record.fqdn]
#}

#resource "aws_route53_record" "caa_record" {
#  zone_id = aws_route53_zone.main_zone.zone_id
#  name    = var.domain_name
#  type    = "CAA"
#  records = [
#    "0 issue \"amazon.com\"",
#    "0 issuewild \"amazon.com\""
#  ]
#  ttl = var.ttl
#}