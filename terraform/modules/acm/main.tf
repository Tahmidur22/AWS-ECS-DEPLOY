resource "aws_acm_certificate" "acm" {
  domain_name       = var.dns_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_route53_zone" "dns_zone" {
  name = var.dns_hosted_zone
}

resource "aws_route53_record" "dns_validation" {
  allow_overwrite = true

  zone_id = data.aws_route53_zone.dns_zone.zone_id
  name    = tolist(aws_acm_certificate.acm.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.acm.domain_validation_options)[0].resource_record_type
  ttl     = var.dns_record_ttl
  records = [tolist(aws_acm_certificate.acm.domain_validation_options)[0].resource_record_value]
}


resource "aws_acm_certificate_validation" "acm_validation" {
  certificate_arn         = aws_acm_certificate.acm.arn
  validation_record_fqdns = [aws_route53_record.dns_validation.fqdn]
}
