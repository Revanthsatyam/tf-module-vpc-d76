resource "aws_subnet" "main" {
  for_each          = var.subnets
  vpc_id            = var.vpc_id
  cidr_block        = each.value["cidr"]
  availability_zone = each.value["az"]

  tags = merge(
    var.tags,
    { Name = "${var.env}-${each.key}-subnet" },
      each.key == "public1" || each.key == "public2" ? {
      "kubernetes.io/role/elb" = 1
    } : {},
      each.key == "app1" || each.key == "app2" ? {
      "kubernetes.io/role/internal-elb" = 1
    } : {}
  )
}

resource "aws_route_table" "main" {
  for_each = var.subnets
  vpc_id   = var.vpc_id

  tags = merge(var.tags, { Name = "${var.env}-${each.key}-RT" })
}

resource "aws_route_table_association" "main" {
  for_each       = var.subnets
  subnet_id      = lookup(lookup(aws_subnet.main, each.key, null), "id", null)
  route_table_id = lookup(lookup(aws_route_table.main, each.key, null), "id", null)
}