vpc_name = "cmtr-rr4mt8nu-01-vpc"
vpc_cidr = "10.10.0.0/16"

subnet_names = {
  "subnet1" = "cmtr-rr4mt8nu-01-subnet-public-a"
  "subnet2" = "cmtr-rr4mt8nu-01-subnet-public-b"
  "subnet3" = "cmtr-rr4mt8nu-01-subnet-public-c"
}

availability_zones = {
  "subnet1" = "us-east-1a"
  "subnet2" = "us-east-1b"
  "subnet3" = "us-east-1c"
}

subnet_cidrs = {
  "subnet1" = "10.10.1.0/24"
  "subnet2" = "10.10.3.0/24"
  "subnet3" = "10.10.5.0/24"
}

internet_gateway_name = "cmtr-rr4mt8nu-01-igw"
routing_table_name    = "cmtr-rr4mt8nu-01-rt"