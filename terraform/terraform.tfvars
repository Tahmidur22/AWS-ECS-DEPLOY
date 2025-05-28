# AWS Region 
location                    = "us-east-1"

# VPC & Networking
vpc_name                    = "ptm-vpc"
cidr_block                  = "10.0.0.0/16"
public_subnet_cidrs         = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones          = ["us-east-1a", "us-east-1b"]

# ECR Repository
ecr_repo_name               = "ptm-ecr-repo"
environment                 = "dev"

# ECS Cluster & Service
ecs_cluster_name           = "ptm-ecs-cluster"
ecs_service_name           = "ptm-ecs-service"
