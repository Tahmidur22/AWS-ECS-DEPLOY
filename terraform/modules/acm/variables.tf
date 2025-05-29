variable "dns_name" {
  description = "The domain name for the ACM certificate (e.g. example.com)"
  type        = string
}

variable "dns_hosted_zone" {
  description = "Hosted zone for DNS validation"
  type        = string
}


variable "dns_record_ttl" {
  description = "TTL for the DNS validation record"
  type        = number
  default     = 300
}
