variable "ssh_key" {
  description = "Provides custom public SSH key."
  type        = string
  default     = ""
}

variable "aws_keypair_name" {
  description = "The name for the AWS key pair."
  type        = string
}

variable "aws_instance_name" {
  description = "The name for the AWS EC2 instance."
  type        = string
}

variable "aws_security_group_name" {
  description = "The name for the security group."
  type        = string
}

variable "project_id" {
  description = "The unique ID for the project."
  type        = string
}

variable "project_name" {
  description = "The unique ID for the project."
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC to use for the EC2 instance."
  type        = string
}
