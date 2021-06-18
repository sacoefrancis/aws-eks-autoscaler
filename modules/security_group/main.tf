resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  vpc_id      = var.vpc_id

  egress {
    description = "Cluster communication with worker nodes"
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  ingress {
    description       = "Allow workstation to communicate with the cluster API Server"
    from_port        = var.ingress_from_port
    to_port          = var.ingress_to_port
    protocol         = var.ingress_protocol
    cidr_blocks      = var.ingress_cidr_blocks
  }

  tags = var.tags
}