terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.23.0" # Greater or equal to      
    }
  }
  required_version = ">= 1.5.7"
}

provider "aws" {
  region = "us-east-1"
}