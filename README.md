# Terraform End-to-End Automation Project

A complete implementation of Infrastructure as Code (IaC) using [Terraform](https://www.terraform.io/), inspired by [this Medium guide](https://medium.com/@kazeemmayeed/end-to-end-automation-with-terraform-a-devops-engineers-guide-to-infrastructure-as-code-48783891fcb1).

---

## 🚀 Project Overview

This project automates the deployment of a robust AWS infrastructure with support for multiple environments (`dev` and `prod`). Key features include:

- **VPC** with public and private subnets across 2 Availability Zones
- **Internet Gateway** and **NAT Gateways**
- **Auto Scaling Group** with 2 EC2 instances
- **Application Load Balancer**
- **Security Groups** with strict access rules
- **IAM Roles** for EC2 instances
- **Custom Web Page** indicating deployment success
- **Remote State** management in S3 with DynamoDB locking
- **Multi-environment** support (`dev` and `prod`)
- **Jenkins CI/CD** pipeline ready
- **Resource Tagging** for easy management
- **Health Checks** and **Auto-scaling**

---

## 📝 Getting Started

Follow these steps to set up and deploy the infrastructure:

### 1. Create the Directory Structure

```bash
mkdir -p terraform-project/{modules/{network,compute},environments/{dev,prod}}
```

### 2. Organize the Files

- **Root files:** Place in `terraform-project/`
- **Network module:** Place in `terraform-project/modules/network/`
- **Compute module:** Place in `terraform-project/modules/compute/`
- **Environment files:** Place in `terraform-project/environments/dev/` and `terraform-project/environments/prod/`

### 3. Set Up AWS Resources

```bash
cd terraform-project
chmod +x setup.sh
./setup.sh
```

### 4. Configure Remote State

Update the S3 bucket name in `backend.tf` with the bucket created by `setup.sh`.

### 5. Deploy the Infrastructure

```bash
chmod +x deploy.sh
./deploy.sh 
```

```bash
Enter environment (dev/prod): dev
Enter action (plan/apply/destroy): plan
```

### 6. Access Your Application

After deployment, the script will output the Load Balancer URL. Open it in your browser to view the deployed web page.

---

## 📂 Directory Structure

```
terraform-project/
├── modules/
│   ├── network/
│   └── compute/
├── environments/
│   ├── dev/
│   └── prod/
├── setup.sh
├── deploy.sh
├── backend.tf
└── ...
```

---

## 🛠️ Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS CLI configured with appropriate credentials
- Bash shell

---

## 📢 Notes

- Ensure your AWS credentials have sufficient permissions to create the required resources.
- For production deployments, review and adjust security group rules and IAM policies as needed.

---

Happy Automating! 🚀
