variable "cidr_block" {
  type = string
  description = "(Required) The CIDR block for the subnet."
}

variable "vpc_id" {
  type = string
  description = "(Required) The VPC ID."
}
 
variable "tags" {
  type = map(any)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default = {}
}

variable "availability_zone" {
  type = string
  description = "availability zone of the subnet"
}

variable "map_public_ip_on_launch" {
  type = bool
  description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false."
}