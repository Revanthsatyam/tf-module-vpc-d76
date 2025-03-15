output "subnets" {
  value = lookup(module.subnets, "app", null)
}