module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id = module.vpc.id
  tags = {
    Name = local.variables.eks_cluster.cluster_name
  }
}