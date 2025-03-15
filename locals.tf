locals {
  #Subnets
  public_subnets = [for k, v in lookup(lookup(module.subnets, "public", null), "subnet", null) : v.id]
  app_subnets    = [for k, v in lookup(lookup(module.subnets, "app", null), "subnet", null) : v.id]
  db_subnets     = [for k, v in lookup(lookup(module.subnets, "db", null), "subnet", null) : v.id]
  #private_subnets = merge(local.app_subnets, local.db_subnets)

  #Route_Tables
  public_route_tables  = [for k, v in lookup(lookup(module.subnets, "public", null), "route_table", null) : v.id]
  app_route_tables     = [for k, v in lookup(lookup(module.subnets, "app", null), "route_table", null) : v.id]
  db_route_tables      = [for k, v in lookup(lookup(module.subnets, "db", null), "route_table", null) : v.id]
  #private_route_tables = merge(local.app_route_tables, local.db_route_tables)

  tags = merge(var.tags, { tf-module-name = "vpc" }, { env = var.env })
}