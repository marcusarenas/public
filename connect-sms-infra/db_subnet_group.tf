module "db_subnet_group" {
  source      = "git::https://github.com/developer-productivity/aws-resources-modules.git//db_subnet_group"

  project     = var.project
  environment = var.environment
  tags        = merge(var.tags, var.module_tags, var.extra_tags)
  subnet_ids  = lookup(var.subnet_ids, var.environment)
}