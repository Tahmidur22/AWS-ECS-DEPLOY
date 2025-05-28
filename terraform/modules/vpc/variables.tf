variable "cidr_block" {
  type        = string
  description = "The cidr block for vpc"
}
variable "vpc_name" {
  type        = string
  description = "The name tag for the VPC"
  default     = "vpc"
}
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}
variable "availability_zones" {
  type        = list(string)
  description = "The availability zones for the subnets"
}
variable "ecs_sg_name" {
  type        = string
  description = "The name of the security group"
}