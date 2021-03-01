output "zone_id" {
    value = aws_route53_zone.main_zone.zone_id
}

output "cert_arn" {
    value = aws_acm_certificate.cert_request.arn
}

output "cert_id" {
    value = aws_acm_certificate.cert_request.id
}