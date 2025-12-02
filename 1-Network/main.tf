terraform {
  # Backend configuration for storing the state file remotely.
  # Replace 'your-terraform-state-bucket' with the name of your S3 bucket.
  # backend "s3" {
  #  bucket = "your-terraform-state-bucket"
  #  key    = "vpc/terraform.tfstate"
  #  region = "us-east-1"
  #}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.23.0" # Greater or equal to      
    }
  }
  required_version = ">= 1.5.7"
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}