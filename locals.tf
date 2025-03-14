locals {
  tags = merge(var.tags, { tf-module-name = "vpc" }, { env = var.env })
}