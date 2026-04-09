# AGENTS.md

## Overview

This repo contains Terraform code that deploys to **LocalStack** (AWS cloud emulator), not real AWS.

## Developer Commands

```bash
# Initialize Terraform (in basic-server/ directory)
terraform init

# Plan against LocalStack
tflocal plan

# Apply to LocalStack
tflocal apply

# Destroy resources
tflocal destroy

# Format Terraform files
terraform fmt
```

## Important Context

- **LocalStack endpoint**: `http://localhost:4566` (must be running)
- **Resources created**: VPC, subnet, security group, EC2 instance with Apache HTTP server

## Prerequisites

1. LocalStack must be running (`localstack start` or Docker container on port 4566)
2. `tflocal` must be installed (`pip install terraform-local`)


