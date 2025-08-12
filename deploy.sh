#!/bin/bash
set -e

# Prompt for environment if not provided
if [ -z "$1" ]; then
    read -p "Enter environment (dev/prod): " ENVIRONMENT
else
    ENVIRONMENT=$1
fi

# Validate environment input
if [[ "$ENVIRONMENT" != "dev" && "$ENVIRONMENT" != "prod" ]]; then
    echo "Invalid environment. Please enter 'dev' or 'prod'."
    exit 1
fi

# Prompt for action if not provided
if [ -z "$2" ]; then
    read -p "Enter action (plan/apply/destroy): " ACTION
else
    ACTION=$2
fi

# Validate action input
if [[ "$ACTION" != "plan" && "$ACTION" != "apply" && "$ACTION" != "destroy" ]]; then
    echo "Invalid action. Please enter 'plan', 'apply', or 'destroy'."
    exit 1
fi

echo "Deploying to $ENVIRONMENT environment..."

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
esac
