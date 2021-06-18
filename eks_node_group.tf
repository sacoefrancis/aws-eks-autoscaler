module "eks_node_group" {
  source = "./modules/eks_node_group"

  cluster_name = module.eks_cluster.id
  node_group_name = local.variables.eks_node_group.node_group_name
  node_role_arn = module.iam_roles[local.variables.eks_node_group.role_name].arn
  subnet_ids = local.subnet_ids

  desired_size = local.variables.eks_node_group.desired_size
  max_size = local.variables.eks_node_group.max_size
  min_size     = local.variables.eks_node_group.min_size
  eks_node_group_depends_on = [
    kubernetes_config_map.aws_auth,
    module.iam_role_policy_attachment
    ]
}