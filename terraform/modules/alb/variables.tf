variable "name" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "target_port" {
  type = number
}

variable "vpc_id" {
  type = string
}

variable "listener_port" {
  type = number
}

variable "health_check_path" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
