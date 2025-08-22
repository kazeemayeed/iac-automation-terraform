# Security Policy

We take security seriously. Please follow the guidelines below to help us keep this project safe.

---

## Supported Versions

We only support security updates on the following:

| Version | Supported          |
|---------|--------------------|
| main    | ✅ (active)        |
| tags    | ✅ (latest stable) |
| older   | ❌ (no guarantees) |

---

## Reporting a Vulnerability

If you discover a security issue, please **do not open a public GitHub issue**.  
Instead, report it responsibly:

1. git checkout -b feature/<short-description>
# or
git checkout -b fix/<short-description> 

2. **Do not** share exploit details publicly until the issue is resolved.  

3. We will acknowledge your report within **48 hours** and provide a timeline for remediation.

---

## Security Best Practices for Contributors

- **Secrets Management**
  - Never hardcode passwords, API keys, or tokens.
  - Use Vault, AWS SSM, or other secret managers.

- **Terraform Practices**
  - Pin provider versions.
  - Use `sensitive = true` for variables that hold secrets.
  - Apply least-privilege IAM roles and policies.

- **Validation & Scanning**
  - Run before committing:
    ```bash
    terraform fmt -recursive
    terraform validate
    tflint
    checkov -d .
    ```

- **Reviews**
  - All Pull Requests must pass security scans in CI.
  - At least one reviewer approval is required.

---

## Disclosure Policy

- **Responsible Disclosure**: Do not share vulnerabilities publicly until they are fixed.  
- **Acknowledgments**: With your consent, we may credit you in release notes after resolution.  

---

Following these steps ensures we keep the repo **secure, compliant, and production-ready**.
