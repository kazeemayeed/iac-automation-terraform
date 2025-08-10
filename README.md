# Terraform End-to-End Automation Project

complete project implementation by using "https://medium.com/@kazeemmayeed/end-to-end-automation-with-terraform-a-devops-engineers-guide-to-infrastructure-as-code-48783891fcb1"



\# ============================================================================

\# INSTRUCTIONS TO USE THIS PROJECT

\# ============================================================================



\# STEP 1: Create the directory structure

mkdir -p terraform-project/{modules/{network,compute},environments/{dev,prod}}



\# STEP 2: Copy each section above to the appropriate files:

\# - Root files go in terraform-project/

\# - Network module files go in terraform-project/modules/network/

\# - Compute module files go in terraform-project/modules/compute/

\# - Environment files go in terraform-project/environments/{dev,prod}/



\# STEP 3: Set up AWS resources

cd terraform-project

chmod +x setup.sh

./setup.sh



\# STEP 4: Update the S3 bucket name in backend.tf with the one created by setup.sh



\# STEP 5: Deploy

chmod +x deploy.sh

./deploy.sh dev plan      # Plan the deployment

./deploy.sh dev apply     # Deploy to dev environment



\# STEP 6: Access your website

\# The script will output the load balancer URL at the end



## Overview
This project deploys a fully automated AWS infrastructure with multi-environment support, including:

\# VPC with public/private subnets across 2 AZs

\# Internet Gateway and NAT Gateways

\# Auto Scaling Group with 2 EC2 instances

\# Application Load Balancer

\# Security Groups with proper access rules

\# IAM roles for EC2 instances

\# Beautiful web page showing deployment success

\# Remote state in S3 with DynamoDB locking

\# Multi-environment support (dev/prod)

\# Jenkins CI/CD pipeline ready

\# Proper resource tagging

\# Health checks and auto-scaling



