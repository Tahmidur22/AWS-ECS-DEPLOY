output "certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.acm.arn
}

output "certificate_status" {
  description = "The status of the ACM certificate"
  value       = aws_acm_certificate.acm.status
}
output "certificate_validation" {
  value = aws_acm_certificate_validation.acm_validation
}


