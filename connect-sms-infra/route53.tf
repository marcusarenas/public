module "route53_record_rds" {
  source      = "git::https://github.com/developer-productivity/aws-resources-modules.git//route53_record"

  project     = var.project
  environment = var.environment
  tags        = var.tags

  zone_id     = lookup(var.zone_id, var.environment)
  name        = lookup(var.zone_name, var.environment)
  type        = lookup(var.zone_type, var.environment)
  ttl         = lookup(var.zone_ttl, var.environment)
  records     = [ 
    lookup(var.records, var.environment)
  ]
}