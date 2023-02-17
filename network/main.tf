# create vpc and subnets for the environment
resource "aws_vpc" "cloud_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name        = "${var.environment}-vpc-network"
    Environment = var.environment
  }
}

# create public subnet
resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet)

  vpc_id                  = aws_vpc.cloud_vpc.id
  cidr_block              = element(var.public_subnet, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_${var.availability_zones[count.index]}"
  }
}

# create private subnet
resource "aws_subnet" "private_subnet" {
  count                   = length(var.private_subnet)

  vpc_id                  = aws_vpc.cloud_vpc.id
  cidr_block              = element(var.private_subnet, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
  
  tags = {
    Name = "private_subnet_${var.availability_zones[count.index]}"
  }
}
