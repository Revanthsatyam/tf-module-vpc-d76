output "subnet" {
  value = lookup(aws_subnet.main, subnet, null)
}

# output "route_table" {
#   value = aws_route_table.main
# }