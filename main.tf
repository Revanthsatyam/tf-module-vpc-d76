resource "aws_vpc" "main" {
  cidr_block = var.cidr
  name       = "${var.env}-vpc"
}