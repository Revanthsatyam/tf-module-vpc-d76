output "subnet" {
  value = lookup(aws_subnet, main, null )
}

# output "route_table" {
#   value = aws_route_table.main
# }