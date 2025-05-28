module "named_vpc" {
  source     = "./modules/vpc"
  cidr_block = var.cidr_block
  vpc_name   = var.vpc_name
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones   = var.availability_zones
  ecs_sg_name          = "ecs-security-group"
}
module "ecr" {
  source      = "./modules/ecr"
  repo_name   = var.ecr_repo_name
  environment = var.environment
}
# module "ecs" {
#   source              = "./modules/ecs"
#   ecs_cluster_name    = var.ecs_cluster_name
#   ecs_service_name    = var.ecs_service_name
#   desired_count       = 1
#   subnet_ids          = module.named_vpc.public_subnet_ids
#   ecs_sg_id           = module.named_vpc.ecs_sg_id
  
# }
module "ecs" {
  source              = "./modules/ecs"
  ecs_cluster_name    = var.ecs_cluster_name
  ecs_service_name    = var.ecs_service_name
  desired_count       = 1
  container_image     = "${module.ecr.repository_url}:latest"
  subnet_ids          = module.named_vpc.public_subnet_ids
  ecs_sg_id           = module.named_vpc.ecs_sg_id
  
}
