# 0-Guide: Terraform AWS Get Started

This folder contains a beginner-friendly Terraform configuration for learning how to provision AWS resources.

## Overview

This module demonstrates fundamental Terraform concepts including:
- **Providers**: AWS provider configuration
- **Modules**: Using the official AWS VPC Terraform module
- **Data Sources**: Querying AWS for the latest Ubuntu AMI
- **Resources**: Creating an EC2 instance
- **Variables**: Parameterizing your infrastructure
- **Outputs**: Exposing infrastructure values

## Resources Created

- **VPC**: Uses `terraform-aws-modules/vpc/aws` module (v5.19.0)
  - CIDR Block: `10.0.0.0/16`
  - Availability Zones: `us-west-2a`, `us-west-2b`, `us-west-2c`
  - Private Subnets: `10.0.1.0/24`, `10.0.2.0/24`
  - Public Subnets: `10.0.101.0/24`
  - DNS Hostnames: Enabled

- **EC2 Instance**: Ubuntu 24.04 LTS instance
  - Type: `t2.micro` (default, configurable)
  - AMI: Latest Ubuntu Noble 24.04 (fetched dynamically)
  - Placement: Private subnet
  - Security Group: Default VPC security group

## Files

- `terraform.tf`: Provider configuration and required versions
- `main.tf`: Core infrastructure resources (VPC module and EC2 instance)
- `variables.tf`: Input variables for customization
- `outputs.tf`: Output values for reference

## Configuration

### Variables

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `instance_name` | string | `learn-terraform` | Name tag for the EC2 instance |
| `instance_type` | string | `t2.micro` | EC2 instance type |

### Outputs

| Output | Description |
|--------|-------------|
| `instance_hostname` | Private DNS name of the EC2 instance |

## Prerequisites

- Terraform >= 1.2.0
- AWS account with appropriate permissions
- AWS CLI configured with credentials

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the plan:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. Destroy when done:
   ```bash
   terraform destroy
   ```

## AWS Region

The configuration is set to deploy resources in **us-west-2** (Oregon).

## References

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS VPC Module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
- [Terraform AWS Tutorials](https://developer.hashicorp.com/terraform/tutorials/aws)
