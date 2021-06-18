variable "cidr_block" {
  type = string
  description = "(Required) The CIDR block for the VPC."
}

variable "tags" {
  type = map(any)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default = {}
}