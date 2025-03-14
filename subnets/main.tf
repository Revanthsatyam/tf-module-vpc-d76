resource "aws_subnet" "main" {
  vpc_id = var.vpc_id

  for_each          = var.subnets
  cidr_block        = each.value["cidr"]
  availability_zone = each.value["az"]

  tags = merge(var.tags, { Name = each.key })
}