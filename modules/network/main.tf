resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = var.tags
}

resource "aws_subnet" "public_admin" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_admin_cidr
  availability_zone       = var.availability_zone_admin
  map_public_ip_on_launch = true

  tags = var.tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = var.tags
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = var.tags
}

resource "aws_route_table_association" "public_admin" {
  subnet_id      = aws_subnet.public_admin.id
  route_table_id = aws_route_table.public_rt.id
}