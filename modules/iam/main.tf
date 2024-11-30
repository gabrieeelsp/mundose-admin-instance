# Crear el Role de IAM para EKS
resource "aws_iam_role" "eks_role" {
  name = var.eks_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "ec2.amazonaws.com"
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Crear una política de permisos para EKS
resource "aws_iam_policy" "eks_policy" {
  name        = var.eks_policy_name
  description = "Permisos necesarios para gestionar EKS"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "eks:*",                     # Permisos para EKS
          "ec2:*",     # Permisos para describir EC2
          "iam:*",            # Permisos para crear etiquetas
          "ssm:*",            # Permisos para borrar etiquetas
          "autoscaling:*", # Acceso a ECR
          "cloudformation:*",
          "s3:*",                       # Acceso opcional a S3
          "elasticloadbalancing:*",
        ]
        Resource = "*"
      }
    ]
  })
}

# Adjuntar la política al Role de EKS
resource "aws_iam_role_policy_attachment" "eks_role_policy_attachment" {
  role       = aws_iam_role.eks_role.name
  policy_arn = aws_iam_policy.eks_policy.arn
}

# Crear un Instance Profile para EC2 (opcional)
resource "aws_iam_instance_profile" "eks_instance_profile" {
  name = var.eks_instance_profile_name
  role = aws_iam_role.eks_role.name
}
