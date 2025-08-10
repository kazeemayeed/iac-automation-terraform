locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
  }
}

module "network" {
  source = "./modules/network"
  
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  environment        = var.environment
  project_name       = var.project_name
  tags               = local.common_tags
}

module "compute" {
  source = "./modules/compute"
  
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  public_subnet_ids  = module.network.public_subnet_ids
  instance_type      = var.instance_type
  environment        = var.environment
  project_name       = var.project_name
  tags               = local.common_tags
  
  depends_on = [module.network]
}
