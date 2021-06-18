module "iam_roles" {
  source = "./modules/iam_role"

  for_each           = local.variables.iam_roles
  iam_role_name      = each.key
  assume_role_policy = each.value.assume_role_policy
}