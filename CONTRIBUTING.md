# Contributing Guidelines

Thank you for contributing to this Terraform repository!  
We follow Infrastructure-as-Code best practices to ensure **consistency, security, and maintainability**.  
Please review and follow these guidelines before submitting changes.

---

## Repository Structure
- `modules/` → Reusable Terraform modules (e.g., networking, compute, IAM).  
- `environments/` → Environment-specific configs (`dev/`, `stage/`, `prod/`).  
- `pipelines/` → CI/CD workflows for validate, plan, and apply.  
- `docs/` → Documentation and design decisions.  
- `tests/` → Automated tests (validate, lint, security, terratest).  

---

## Contribution Workflow

1. **Fork & Branch**
   ```bash
   git checkout -b feature/<short-description>
   # or
   git checkout -b fix/<short-description>
