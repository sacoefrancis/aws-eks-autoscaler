output "id" {
  description = "The ID of the routing table."
  value = aws_route_table.route_table.id
}

output "arn" {
  description = "The ARN of the routing table."
  value = aws_route_table.route_table.arn
}

output "owner_id" {
  description = "The ID of the AWS account that owns the routing table."
  value = aws_route_table.route_table.owner_id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_route_table.route_table.tags_all
}
