module "vpc" {
  source = "./modules/vpc"

  cidr_block = local.variables.vpc.cidr_block

  tags = {
    Name = local.variables.eks_cluster.cluster_name
    format("%s%s", "kubernetes.io/cluster/", local.variables.eks_cluster.cluster_name) = "shared"
  }
}