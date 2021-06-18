module "eks_cluster" {
  source = "./modules/eks_cluster"

  cluster_name = local.variables.eks_cluster.cluster_name
  role_arn = module.iam_roles[local.variables.eks_cluster.role_name].arn
  subnet_ids = local.subnet_ids
  security_group_ids = [module.security_group.id]
  eks_cluster_depends_on = [
    module.iam_role_policy_attachment
    ] 
}
