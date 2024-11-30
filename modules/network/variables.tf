variable "vpc_cidr" {
  description = "CIDR para la VPC"
  type        = string
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
}

variable "public_subnet_admin_cidr" {
  description = "CIDR block para la subnet pública para admin"
  type        = string
}

variable "availability_zone_admin" {
  description = "Zona de disponibilidad donde se creará la subnet pública de admin"
  type        = string
}
