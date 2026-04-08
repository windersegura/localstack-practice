variable "region" {
  description = "AWS region (LocalStack ignores this but Terraform requires it)"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the entire VPC address space"
  default     = "10.0.0.0/16"   # 65,536 IPs available
}

variable "public_subnet_cidr" {
  description = "Subset of VPC CIDR assigned to the public subnet"
  default     = "10.0.1.0/24"   # 256 IPs
}

variable "ami_id" {
  description = "AMI to launch. LocalStack accepts any string — use a real AMI ID format"
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 (symbolic in LocalStack)
}

variable "instance_type" {
  description = "EC2 instance size"
  default     = "t2.micro"
}

variable "project_name" {
  description = "Prefix applied to every resource Name tag for easy filtering"
  default     = "localstack-demo"
}