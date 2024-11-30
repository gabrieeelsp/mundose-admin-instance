variable "ami_id" {
  description = "AMI ID para la instancia EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "ssh_key_name" {
  description = "Nombre de la clave SSH"
  type        = string
}

variable "instance_name" {
  description = "Nombre de la instancia EC2"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se asociará el Security Group"
  type        = string
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
}

variable "public_subnet_id" {
  description = "ID de la subnet pública donde se ubicará la instancia"
  type        = string
}

variable "iam_instance_profile" {
  description = "Nombre del Instance Profile asociado al Role de IAM"
  type        = string
  default     = null # Para que sea opcional
}