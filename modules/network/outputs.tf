output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_admin_id" {
  value = aws_subnet.public_admin.id
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.igw.id
}

output "aws_route_table" {
  value = aws_route_table.public_rt.id
}