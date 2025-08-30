terraform {
#  backend "s3" {
#    # bucket         = "my-terraform-state-bucket-12345"  # CHANGE THIS TO YOUR UNIQUE BUCKET NAME
#    bucket         = "devops-directive-tf-state-vicky-mac"
#    key            = "infrastructure/terraform.tfstate"
#    region         = "us-east-1"
#    # dynamodb_table = "terraform-lock-table"
#    dynamodb_table = "terraform-state-locking" # CHANGE THIS TO YOUR DYNAMODB TABLE
#    encrypt        = true
#  }


  required_version = ">= 1.0"
## provider defined in main.tf
 # required_providers {
 #   aws = {
 #     source  = "hashicorp/aws"
 #     version = "~> 5.0"
 #   }
 # }
}

# File: provider.tf
provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = var.owner
    }
  }
}
