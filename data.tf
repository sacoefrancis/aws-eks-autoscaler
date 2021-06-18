data "aws_caller_identity" "current" {}

data "aws_iam_user" "current" {
  user_name = local.variables.user_name
}

data "aws_eks_cluster_auth" "eks_cluster" {
  name = module.eks_cluster.id
}

data "aws_eks_cluster" "eks_cluster" {
  name = module.eks_cluster.id
}

data "http" "workstation-external-ip" {
  url = "http://ipv4.icanhazip.com"
}

locals {
  workstation-external-cidr = "${chomp(data.http.workstation-external-ip.body)}/32"
  map_roles = [
     for role_name in sort(keys(local.variables.iam_roles)) : {
        rolearn  = module.iam_roles[role_name].arn
        username = role_name
        groups   = ["system:masters"]
     } 
  ]
  map_users = [
    {
      userarn  = data.aws_iam_user.current.arn
      username = data.aws_iam_user.current.user_name
      groups   = ["system:masters"]
    }
  ]
  subnet_ids = [
     for subnet_name in sort(keys(local.variables.subnets)) : 
        module.subnet[subnet_name].id
    ]
    permissionsbyrole = flatten([
    for roleName, permlist in local.variables.iam_role_policy_attachments : [
      for policy in permlist : {
        role_name = roleName
        policy    = policy
      }
    ]
  ])
}