locals {
  tags = merge(var.tags, name = "${var.env}-vpc")
}