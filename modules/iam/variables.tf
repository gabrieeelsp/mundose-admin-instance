variable "eks_role_name" {
  description = "Nombre del Role de IAM para EKS"
  type        = string
}

variable "eks_policy_name" {
  description = "Nombre de la política de permisos para EKS"
  type        = string
}

variable "eks_instance_profile_name" {
  description = "Nombre del Instance Profile para asociar con EC2 (opcional)"
  type        = string
}
