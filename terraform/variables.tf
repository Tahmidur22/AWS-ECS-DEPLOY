variable "vpc_name" {
  type = string
  description = "The name tag for the VPC"
}

variable "cidr_block" {
  type = string
}
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}
variable "availability_zones" {
  type        = list(string)
  description = "The availability zones for the subnets"
}
variable "location" {
  type = string
}
variable "ecr_repo_name" {
  type        = string
  description = "ECR repository name"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, prod, etc)"
}
variable "ecs_cluster_name" {
  type    = string
}

variable "ecs_service_name" {
  type    = string
}
variable "listener_port" {
  type    = number
  default = 80
}

variable "target_port" {
  type    = number
  default = 3000
}

variable "health_check_path" {
  type    = string
  default = "/"
}
variable "dns_hosted_zone" {
  type        = string
  description = "The name of the DNS"
}
variable "dns_name" {
  type        = string
  description = "The name of the DNS"
}
variable "dns_record_ttl" {
  description = "TTL for DNS validation record"
  type        = number
  default     = 300
}

