module "route_table_association" {
  source = "./modules/route_table_association"

  route_table_id = module.route_table.id
  for_each = local.variables.subnets
  subnet_id = module.subnet[each.key].id
}