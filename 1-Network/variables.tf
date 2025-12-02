variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_names" {
  description = "A map of names for the public subnets"
  type        = map(string)
}

variable "availability_zones" {
  description = "A map of availability zones for the subnets"
  type        = map(string)
}

variable "subnet_cidrs" {
  description = "A map of CIDR blocks for the public subnets"
  type        = map(string)
}

variable "internet_gateway_name" {
  description = "Name for the Internet Gateway"
  type        = string
}

variable "routing_table_name" {
  description = "Name for the public route table"
  type        = string
}