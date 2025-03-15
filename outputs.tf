output "subnets" {
  value = [ for k,v in lookup(lookup(module.subnets, "app", null), "route_table", null): v.id ]
}