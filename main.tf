resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags       = merge(local.tags, { Name = "${var.env}-vpc" })
}

module "subnets" {
  source = "./subnets"

  vpc_id = aws_vpc.main.id
  tags   = local.tags
  env    = var.env

  for_each = var.subnets
  subnets  = each.value
}