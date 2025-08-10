#!/bin/bash
set -e

echo "Setting up Terraform DevOps Project..."

# Create project structure
mkdir -p terraform-project/{modules/{network,compute},environments/{dev,prod}}

# Create unique S3 bucket name
BUCKET_NAME="terraform-state-$(date +%s)-$(whoami)"
echo "Creating S3 bucket: $BUCKET_NAME"

# Create S3 bucket for state
aws s3 mb s3://$BUCKET_NAME

# Create DynamoDB table for state locking
aws dynamodb create-table \
    --table-name terraform-lock-table \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region us-east-1

echo "Setup complete!"
echo "Update backend.tf with your S3 bucket name: $BUCKET_NAME"
