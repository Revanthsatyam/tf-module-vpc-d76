resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags       = merge(local.tags, { Name = "${var.env}-vpc" })
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.main.id

  for_each          = var.subnets
  subnets           = each.value
  #cidr_block        = "10.0.1.0/24"
  #availability_zone = ""

  tags = merge(local.tags, { Name = "${var.env}-subnet" })
}