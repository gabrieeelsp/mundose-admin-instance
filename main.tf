# Especificar el proveedor de AWS
provider "aws" {
  region = "us-east-1" # Región donde se desplegarán los recursos
}

# Módulo para la red (VPC, subnets, internet gateway, etc.)
module "network" {
  source = "./modules/network"

  vpc_cidr                 = "10.0.0.0/16"
  public_subnet_admin_cidr = "10.0.1.0/24"
  availability_zone_admin  = "us-east-1a"

  tags = {
    Project = "EKS Project"
  }
}

# Módulo de IAM para EKS
module "iam" {
  source = "./modules/iam"

  eks_role_name             = "eks-cluster-role"
  eks_policy_name           = "eks-cluster-policy"
  eks_instance_profile_name = "eks-instance-profile"
}

# Módulo para la instancia EC2 de administración
module "ec2" {
  source = "./modules/admin"

  ami_id           = "ami-064519b8c76274859"
  instance_type    = "t2.micro"
  ssh_key_name     = "pin"
  public_subnet_id = module.network.public_subnet_admin_id
  instance_name   = "EKS-Admin" # Aquí defines el nombre
  vpc_id          = module.network.vpc_id # Pasar el ID de la VPC
  # Usar el Instance Profile creado por el módulo IAM
  iam_instance_profile = module.iam.eks_instance_profile_name

  tags = {
    Name = "EKS Admin"
  }
}
