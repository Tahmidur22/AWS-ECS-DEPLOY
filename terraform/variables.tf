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
