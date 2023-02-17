# create vpc and subnets for the environment
resource "aws_vpc" "cloud_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.environment}-vpc-network"
    Environment = var.environment
  }
}

# create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.cloud_vpc.id
  count                   = length(var.public_subnet)
  cidr_block              = element(var.public_subnet, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_${var.availability_zones[count.index]}"
  }
}

# create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.cloud_vpc.id
  count                   = length(var.private_subnet)
  cidr_block              = element(var.private_subnet, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet_${var.availability_zones[count.index]}"
  }
}

# create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cloud_vpc.id
  tags = {
    Name = "Dev Internet Gateway"
  }
}

# create route table to associate
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.cloud_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_route_table"
  }
}
# associate public subnet with route table
resource "aws_route_table_association" "public_subnet_route_table_association" {
  count          = length(var.public_subnet)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}
