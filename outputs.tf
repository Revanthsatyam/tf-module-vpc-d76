output "subnets" {
  value = lookup(lookup(lookup(module.subnets, "app", null), "route_table", null), "app1", null)
}