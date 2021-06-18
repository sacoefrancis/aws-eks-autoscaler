variable "vpc_id" {
    type = string
    description = "(Required) The VPC ID to create in."
}
    
variable "tags" {
    type = map(any)
    description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
    default = {}
}
