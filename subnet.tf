module "subnet" {
  source = "./modules/subnet"

  vpc_id = module.vpc.id
  for_each = local.variables.subnets
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags = {
    Name = local.variables.eks_cluster.cluster_name
    format("%s%s", "kubernetes.io/cluster/", local.variables.eks_cluster.cluster_name) = "shared"
  }
}