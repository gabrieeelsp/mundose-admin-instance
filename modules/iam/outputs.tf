output "eks_role_name" {
  value       = aws_iam_role.eks_role.name
  description = "Nombre del Role de IAM para EKS"
}

output "eks_policy_arn" {
  value       = aws_iam_policy.eks_policy.arn
  description = "ARN de la política asociada al Role de IAM para EKS"
}

output "eks_instance_profile_name" {
  value       = aws_iam_instance_profile.eks_instance_profile.name
  description = "Nombre del Instance Profile asociado al Role de IAM"
}
