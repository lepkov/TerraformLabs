# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Create the public subnets using a for_each loop
resource "aws_subnet" "public" {
  for_each = var.subnet_cidrs

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = var.availability_zones[each.key]
  tags = {
    Name = var.subnet_names[each.key]
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.internet_gateway_name
  }
}

# Create a route table for the public subnets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.routing_table_name
  }
}

# Associate the route table with all public subnets
resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
}

# Get a reference to the default route table and manage it
# resource "aws_default_route_table" "default_rt" {
#   # Find the default route table for our VPC
#   default_route_table_id = aws_vpc.main.default_route_table_id

#   # Add a route to the Internet Gateway to make it a public route table
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = var.routing_table_name
#   }
# }