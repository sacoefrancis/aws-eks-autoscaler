resource "kubernetes_config_map" "aws_auth" {
  # count      = var.create_eks && var.manage_aws_auth ? 1 : 0
  depends_on = [module.eks_cluster]

  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
    labels = merge(
      {
        "app.kubernetes.io/managed-by" = "Terraform"
        # / are replaced by . because label validator fails in this lib
        # https://github.com/kubernetes/apimachinery/blob/1bdd76d09076d4dc0362456e59c8f551f5f24a72/pkg/util/validation/validation.go#L166
        "terraform.io/module" = "terraform-aws-modules.eks.aws"
      },
      # var.aws_auth_additional_labels
    )
  }

  data = {
    mapRoles = yamlencode(
      distinct(concat(
        local.map_roles
      ))
    )
    mapUsers    = yamlencode(local.map_users)
    mapAccounts = yamlencode([data.aws_caller_identity.current.account_id])
  }
}