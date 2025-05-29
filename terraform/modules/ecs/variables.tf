variable "ecs_cluster_name" {
  type    = string
  default = "ecs-cluster"
}
variable "ecs_service_name" {
  default = "app-service"
}
variable "desired_count" {
  type        = number
  description = "The desired count of ECS tasks"

}
variable "container_image" {
  type        = string
  description = "The container image"
}
variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for ECS service"
}
variable "ecs_sg_id" {
  type        = string
  description = "The id of container security group"
}
variable "target_group_arn" {
  type        = string
  description = "The ARN of the target group"
  
}
variable "container_port" {
  type        = number
  description = "The port on which the container listens"
}