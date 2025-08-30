
# Backend configuration for remote state storage
terraform {
#  backend "s3" {    #use the backend if s3 bucket is ocnfigured
#    # bucket         = "my-terraform-state-bucket-12345"  # CHANGE THIS TO YOUR UNIQUE BUCKET NAME
#    bucket         = "devops-directive-tf-state-vicky-mac"
#    key            = "infrastructure/terraform.tfstate"
#    region         = "us-east-1"
#    # dynamodb_table = "terraform-lock-table"
#    dynamodb_table = "terraform-state-locking" # CHANGE THIS TO YOUR DYNAMODB TABLE
#    encrypt        = true
#  }
  
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

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
