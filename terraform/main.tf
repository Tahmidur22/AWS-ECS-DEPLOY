module "vpc" {
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

module "ecs" {
  source              = "./modules/ecs"
  ecs_cluster_name    = var.ecs_cluster_name
  ecs_service_name    = var.ecs_service_name
  desired_count       = 1
  container_image     = "${module.ecr.repository_url}:latest"
  subnet_ids          = module.vpc.public_subnet_ids
  ecs_sg_id           = module.vpc.ecs_sg_id
  target_group_arn    = module.alb.target_group_arn
  container_port      = 3000
  
}

module "alb" {
  source            = "./modules/alb"
  name              = "myapp"
  vpc_id            = module.vpc.vpc_id 
  subnet_ids        = module.vpc.public_subnet_ids
  security_groups   = [module.vpc.alb_sg_id]
  listener_port     = 80
  target_port       = 3000
  health_check_path = "/health"
  certificate_arn   = module.acm.certificate_arn
  depends_on = [module.acm]
  

  tags = {
    Environment = "production"
  }
}
module "acm" {
  source         = "./modules/acm"
  dns_name       = var.dns_name
  dns_hosted_zone = var.dns_hosted_zone
  dns_record_ttl  = var.dns_record_ttl
}
module "route53" {
  source      = "./modules/route53"
  dns_name    = var.dns_name
  alb_zone_id = module.alb.alb_zone_id
  alb_dns     = module.alb.alb_dns
  dns_hosted_zone = var.dns_hosted_zone
}



