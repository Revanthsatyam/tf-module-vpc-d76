output "subnets" {
  value = lookup(lookup(module.subnets, "app", null), "route_table", null)
}