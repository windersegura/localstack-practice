# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Terraform Infrastructure-as-Code (IaC) project** that provisions a basic AWS web server environment against **LocalStack** — a local AWS cloud emulator. All infrastructure is deployed to `http://localhost:4566` rather than real AWS, making it safe for learning and experimentation.

## Architecture

The project deploys a single-tier public web server:

```
LocalStack (localhost:4566)
  └── VPC (10.0.0.0/16)
        ├── Internet Gateway
        ├── Public Subnet (10.0.1.0/24)
        │     └── EC2 Instance (t2.micro)
        │           ├── Apache HTTPD (bootstrapped via user_data)
        │           ├── Security Group (TCP 22, 80, 443 inbound)
        │           └── IAM Instance Profile (S3ReadOnly role)
        ├── Route Table (0.0.0.0/0 → IGW)
        └── Network ACL (allow 22, 80, 443, ephemeral traffic)
```

## Prerequisites

1. **LocalStack** must be running: `localstack start` or Docker on port 4566
2. **tflocal** must be installed: `pip install terraform-local`

The `tflocal` wrapper automatically rewrites AWS endpoint URLs to `localhost:4566`.

## Commands

All commands are run from the `basic-server/` directory.

```bash
# Initialize Terraform (download providers)
terraform init

# Preview what will be created
tflocal plan

# Deploy resources to LocalStack
tflocal apply

# Destroy all resources
tflocal destroy

# Format Terraform files
terraform fmt
```

## Project Structure

- `basic-server/provider.tf` — AWS provider configuration (LocalStack-targeted, hashicorp/aws ~> 5.0)
- `basic-server/variables.tf` — Input variables (region, VPC/subnet CIDR, AMI ID, instance type, project name)
- `basic-server/network.tf` — VPC, subnet, internet gateway, route table, NACL, security group
- `basic-server/compute.tf` — EC2 instance with Apache HTTPD bootstrap script
- `basic-server/iam.tf` — IAM role, policy attachment, instance profile
- `AGENTS.md` — Additional developer reference
- `image.png` — Architecture diagram

## Provider Details

- **Locked version**: hashicorp/aws 5.100.0 (see `.terraform.lock.hcl`)
- **Credentials**: Dummy test/test (not used since all calls go to LocalStack)
- **Endpoint override**: All EC2/IAM API calls redirect to `http://localhost:4566`
