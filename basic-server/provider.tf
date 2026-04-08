terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ─────────────────────────────────────────────
# PROVIDER
# tflocal rewrites the endpoint URLs so every
# API call hits LocalStack instead of real AWS.
# ─────────────────────────────────────────────
provider "aws" {
  region                      = var.region
  access_key                  = "test"          # LocalStack accepts any non-empty string
  secret_key                  = "test"
  skip_credentials_validation = true            # Don't validate against real AWS STS
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    # tflocal injects these automatically; shown here for transparency
    ec2 = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}