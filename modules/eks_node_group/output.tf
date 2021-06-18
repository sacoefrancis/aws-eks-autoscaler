output "arn" {
  description = "Amazon Resource Name (ARN) of the EKS Node Group."
  value = aws_eks_node_group.eks_node_group.arn
}

output "id" {
  description = "EKS Cluster name and EKS Node Group name separated by a colon (:)."
  value = aws_eks_node_group.eks_node_group.id
}
