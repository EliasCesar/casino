output "certificate_arn" {
  value = aws_acm_certificate.this.arn
}

output "certificate_domain_name" {
  value = aws_acm_certificate.this.domain_name
}

output "certificate_status" {
  value = aws_acm_certificate.this.status
}

output "certificate_validation_id" {
  value = aws_acm_certificate_validation.this.id
}
