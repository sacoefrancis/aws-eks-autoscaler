locals {
  variables = {
    user_name = "sacoefrancis@gmail.com"
    iam_roles = {
      eks_cluster_role = {
        assume_role_policy = jsonencode({
          Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
              Service = "eks.amazonaws.com"
            }
          }]
          Version = "2012-10-17"
        })
      },
      eks_node_group_role = {
        assume_role_policy = jsonencode({
          Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
              Service = "ec2.amazonaws.com"
            }
          }]
          Version = "2012-10-17"
        })
      }
    }
    iam_role_policy_attachments = {
      eks_cluster_role = [
      "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
      "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
    ],
    eks_node_group_role = [
      "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
      "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
      "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    ]
    }
    vpc = {
      cidr_block = "10.0.0.0/16"
    }
    subnets = {
      subnet1 = {
        cidr_block = "10.0.1.0/24"
        map_public_ip_on_launch = true
        availability_zone = "us-east-1a"
      },
      subnet2 = {
        cidr_block = "10.0.2.0/24"
        map_public_ip_on_launch = true
        availability_zone = "us-east-1b"
      },
    }
    eks_cluster = {
      cluster_name = "eks_cluster_test"
      role_name = "eks_cluster_role"
    }
    eks_node_group = {
      role_name = "eks_node_group_role"
      node_group_name = "eks_node_group_test"
      desired_size = 1
      max_size = 1
      min_size = 1
    }
    security_group = {
      security_group_name = "eks_cluster_security_group"
      egress_from_port = 0
      egress_to_port = 0
      egress_protocol = "-1"
      egress_cidr_blocks = ["0.0.0.0/0"]
      ingress_from_port = 443
      ingress_to_port = 443
      ingress_protocol = "tcp"
    }
    route_table = {
      cidr_block = "0.0.0.0/0"
    }
  }
}
