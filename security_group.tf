module "security_group" {
  source = "./modules/security_group"
  
  security_group_name = local.variables.security_group.security_group_name
  vpc_id = module.vpc.id
  egress_from_port = local.variables.security_group.egress_from_port
  egress_to_port = local.variables.security_group.egress_to_port
  egress_protocol = local.variables.security_group.egress_protocol
  egress_cidr_blocks = local.variables.security_group.egress_cidr_blocks
  ingress_from_port = local.variables.security_group.ingress_from_port
  ingress_to_port = local.variables.security_group.ingress_to_port
  ingress_protocol = local.variables.security_group.ingress_protocol
  ingress_cidr_blocks = [local.workstation-external-cidr]
  tags = {
    Name = local.variables.eks_cluster.cluster_name
  }
}