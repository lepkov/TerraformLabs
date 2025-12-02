# Get the VPC by name
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# Get a list of subnets within that VPC
data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_ami" "al2023" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  owners = ["137112412989"] # Amazon
}

# Create a security group to allow SSH access
resource "aws_security_group" "ssh_access" {
  name        = var.aws_security_group_name
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # WARNING: This allows SSH from any IP. Restrict this in production.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = var.project_name
    ID      = var.project_id
  }
}

# Create the EC2 instance
resource "aws_instance" "web_server" {
  ami           = data.aws_ami.al2023.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnets.selected.ids[0]

  # Attach the key pair created in ssh.tf
  key_name = aws_key_pair.generated_key.key_name

  # Associate the security group
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name    = var.aws_instance_name
    Project = var.project_name
    ID      = var.project_id
  }
}