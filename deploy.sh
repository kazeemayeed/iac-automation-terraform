#!/bin/bash
set -e

ENVIRONMENT=${1:-dev}
ACTION=${2:-plan}

echo "Deploying to $ENVIRONMENT environment..."

# Navigate to project directory
cd terraform-project

# Initialize Terraform
terraform init

# Execute action
case $ACTION in
    plan)
        terraform plan -var-file="environments/${ENVIRONMENT}/terraform.tfvars"
        ;;
    apply)
        terraform plan -var-file="environments/${ENVIRONMENT}/terraform.tfvars" -out=tfplan
        echo "Review plan above. Press Enter to continue..."
        read
        terraform apply tfplan
        echo "Website URL: http://$(terraform output -raw load_balancer_dns)"
        ;;
    destroy)
        terraform destroy -var-file="environments/${ENVIRONMENT}/terraform.tfvars" -auto-approve
        ;;
    *)
        echo "Usage: $0 [dev|prod] [plan|apply|destroy]"
        exit 1
        ;;
esac
