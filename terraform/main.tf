module "named_vpc" {
  source     = "./modules/vpc"
  cidr_block = var.cidr_block
  vpc_name   = var.vpc_name
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones   = var.availability_zones
}