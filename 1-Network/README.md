# 1-Network: VPC and Networking Infrastructure

This folder contains Terraform configuration for building a custom VPC with public subnets, Internet Gateway, and routing infrastructure on AWS.

## Overview

This module demonstrates intermediate Terraform concepts including:
- **Custom VPC**: Creating a VPC with custom CIDR blocks
- **Subnets**: Multiple public subnets across availability zones using `for_each`
- **Internet Gateway**: Gateway for internet connectivity
- **Route Table Management**: Configuring routes for public internet access
- **Variables**: Parameterized configuration for flexibility
- **Outputs**: Exposing key infrastructure IDs

## Resources Created

- **VPC**: Custom VPC with configurable CIDR block
- **Public Subnets**: Multiple subnets distributed across availability zones using `for_each` loops
- **Internet Gateway**: Provides internet connectivity for the VPC
- **Default Route Table**: Configured with route to Internet Gateway (`0.0.0.0/0`)

## Files

- `versions.tf`: Terraform and AWS provider version requirements (AWS >= 6.23.0, Terraform >= 1.5.7)
- `main.tf`: AWS provider configuration for us-east-1 region
- `variables.tf`: Input variables for VPC and network configuration
- `vpc.tf`: Core VPC, subnet, IGW, routing resources, and route table associations
- `outputs.tf`: Output values for VPC, subnets, IGW, and route table
- `terraform.tfvars`: Example values and current configuration for the network deployment

## Configuration

### Variables

| Variable | Type | Description |
|----------|------|-------------|
| `vpc_name` | string | Name of the VPC |
| `vpc_cidr` | string | CIDR block for the VPC |
| `subnet_names` | map(string) | Map of names for public subnets |
| `availability_zones` | map(string) | Map of availability zones for subnets |
| `subnet_cidrs` | map(string) | Map of CIDR blocks for public subnets |
| `internet_gateway_name` | string | Name for the Internet Gateway |
| `routing_table_name` | string | Name for the public route table |

### Outputs

| Output | Description |
|--------|-------------|
| `vpc_id` | The ID of the created VPC |
| `public_subnet_ids` | Map of public subnet IDs (keyed by subnet name) |
| `internet_gateway_id` | The ID of the Internet Gateway |
| `public_route_table_id` | The ID of the public route table |

## Prerequisites

- Terraform >= 1.5.7
- AWS Provider >= 6.23.0
- AWS account with appropriate permissions
- AWS CLI configured with credentials

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Create/update `terraform.tfvars` with your configuration:
   ```hcl
   vpc_name                = "my-vpc"
   vpc_cidr                = "10.0.0.0/16"
   internet_gateway_name   = "my-igw"
   routing_table_name      = "my-public-rt"
   
   availability_zones = {
     subnet1 = "us-east-1a"
     subnet2 = "us-east-1b"
   }
   
   subnet_cidrs = {
     subnet1 = "10.0.1.0/24"
     subnet2 = "10.0.2.0/24"
   }
   
   subnet_names = {
     subnet1 = "Public Subnet 1"
     subnet2 = "Public Subnet 2"
   }
   ```

3. Review the plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. Destroy when done:
   ```bash
   terraform destroy
   ```

## AWS Region

The configuration is set to deploy resources in **us-east-1** (N. Virginia). Adjust the region in `versions.tf` as needed.

## State Management

The configuration includes a commented-out S3 backend for remote state storage. To enable:

1. Create an S3 bucket for Terraform state
2. Uncomment and update the `backend "s3"` block in `versions.tf`
3. Replace `your-terraform-state-bucket` with your bucket name

## Design Patterns

- **for_each Loops**: Subnets are created using `for_each` for scalability and flexibility
- **Data-Driven Configuration**: Variables allow infrastructure to be customized without code changes
- **Modular Outputs**: Outputs are structured as maps for easy integration with other modules

## References

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/)
- [Terraform State Backend Configuration](https://developer.hashicorp.com/terraform/language/settings/backends/s3)
