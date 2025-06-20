variable "repo_name" {
  type        = string
  description = "Name of the ECR repository"
}

variable "environment" {
  type        = string
  description = "Environment (e.g., dev, staging, prod)"
}
