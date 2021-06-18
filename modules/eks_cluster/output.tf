output "arn" {
  description = "ARN of the cluster."
  value = aws_eks_cluster.eks_cluster.arn
}

output "id" {
  description = "Name of the cluster."
  value = aws_eks_cluster.eks_cluster.id
}

output "status" {
  description = "Status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED."
  value = aws_eks_cluster.eks_cluster.status
}

# output "name" {
  
# }
