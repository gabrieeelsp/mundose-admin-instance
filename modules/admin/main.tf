resource "aws_security_group" "ec2_sg" {
  name        = "${var.instance_name}-sg"
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_instance" "main" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.ssh_key_name
  subnet_id       = var.public_subnet_id
  security_groups = [aws_security_group.ec2_sg.id]
   # Agregar soporte para el IAM Instance Profile
  iam_instance_profile = var.iam_instance_profile

  user_data = file("${path.module}/user_data.sh")

  tags = var.tags
}