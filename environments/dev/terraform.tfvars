aws_region         = "us-east-1"
environment        = "dev"
project_name       = "devops-automation"
owner              = "DevOps-Team"
vpc_cidr           = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]
instance_type      = "t3.micro"

# File: environments/prod/terraform.tfvars
aws_region         = "us-east-1"
environment        = "prod"
project_name       = "devops-automation"
owner              = "DevOps-Team"
vpc_cidr           = "10.1.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
instance_type      = "t3.small"
