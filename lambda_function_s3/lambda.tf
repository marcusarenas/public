resource "aws_lambda_function" "main" {
  count                           = var.executions

  filename                        = var.filename
  s3_bucket                       = var.s3_bucket
  s3_key                          = var.s3_key
  s3_object_version               = var.s3_object_version
  function_name                   = var.function_name == "" ? var.project : var.function_name
  dynamic "dead_letter_config" {
    for_each                      = var.dead_letter_config
    content {
      target_arn                  = dead_letter_config.value.target_arn
    }
  }
  dynamic "tracing_config" {
    for_each                      = var.tracing_config
    content {
      mode                        = tracing_config.value.mode
    }
  }
  handler                         = var.handler
  role                            = var.role
  description                     = var.description == "" ? var.project : var.description
  layers                          = var.layers
  memory_size                     = var.memory_size
  runtime                         = var.runtime
  timeout                         = var.timeout
  reserved_concurrent_executions  = var.reserved_concurrent_executions
  publish                         = var.publish
  dynamic "vpc_config" {
    for_each                      = var.vpc_config
    content {
      subnet_ids                  = vpc_config.value.subnet_ids
      security_group_ids          = vpc_config.value.security_group_ids
    }
  }
  environment {
    variables                     = var.variables
  }
  kms_key_arn                     = var.kms_key_arn
  source_code_hash                = var.source_code_hash
  tags                            = merge(tomap({"Name" = var.project}), var.tags, var.extra_tags)
}
