output "iam_role_arns" {
  description = "Amazon Resource Name (ARN) specifying the role."
  value       = { for role_name in sort(keys(local.variables.iam_roles)) : role_name => module.iam_roles[role_name].arn }
}

output "vpc_arn" {
  description = "Amazon Resource Name (ARN) of VPC"
  value = module.vpc.arn
}

output "subnet_id" {
  description = "The ID of the subnet"
  value = { for subnet_name in sort(keys(local.variables.subnets)) : subnet_name => module.subnet[subnet_name].id }
}

output "subnet_arn" {
  description = "The ARN of the subnet"
  value = { for subnet_name in sort(keys(local.variables.subnets)) : subnet_name => module.subnet[subnet_name].arn }
}

output "eks_cluster_id" {
  description = "Name of the cluster."
  value = module.eks_cluster.id
}

output "eks_node_group_id" {
  description = "EKS Cluster name and EKS Node Group name separated by a colon (:)."
  value = module.eks_node_group.id
}

output "internet_gateway_id" {
  description = "The ARN of the Internet Gateway."
  value = module.internet_gateway.arn
}

output "public_ip" {
  description = "public ip"
  value = local.workstation-external-cidr
}

