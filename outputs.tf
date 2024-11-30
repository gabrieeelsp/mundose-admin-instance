# Output del ID de la VPC
output "vpc_id" {
  value       = module.network.vpc_id
  description = "ID de la VPC creada"
}

# Output de las subnets públicas
output "public_subnet_amdin_id" {
  value       = module.network.public_subnet_admin_id
  description = "IDs de la subnet pública de admin"
}