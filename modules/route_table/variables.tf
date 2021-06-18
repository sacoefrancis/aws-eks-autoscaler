variable "vpc_id" {
  type = string
  description = "(Required) The VPC ID."
}

variable "cidr_block" {
  type = string
  description = "(Required) The CIDR block of the route."
}

variable "gateway_id" {
  type = string
  description = "(Optional) Identifier of a VPC internet gateway or a virtual private gateway."
}
