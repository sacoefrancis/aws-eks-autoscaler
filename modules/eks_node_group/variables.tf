variable "cluster_name" {
  type = string
  description = "(Required) Name of the cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores."
}

variable "node_role_arn" {
  type = string
  description = "(Required) Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group."
}

variable "node_group_name" {
  type = string
  description = "(Optional) Name of the EKS Node Group. If omitted, Terraform will assign a random, unique name. Conflicts with node_group_name_prefix."
}

variable "subnet_ids" {
  # type = string
  description = "(Required) Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)."
}

variable "tags" {
  type = map(any)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default = {}
}

variable "eks_node_group_depends_on" {
  # type = list(any)
  description = "cluster dependencies"
}

variable "desired_size" {
  type = number
  description = "(Required) Desired number of worker nodes."
}

variable "max_size" {
  type = number
  description = "(Required) Maximum number of worker nodes."
}

variable "min_size" {
  type = number
  description = "(Required) Minimum number of worker nodes."
}
