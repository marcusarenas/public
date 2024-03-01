locals{
  files = concat(var.files, var.file != null ? [var.file] : [] )
}

data "archive_file" "lambda-zip-file" {
  type = "zip"

  dynamic "source" {
	for_each = local.files
	content {
	  content = file(source.value)
	  filename = regex("(?P<name>[\\w-]+[.]\\w+)$",source.value).name
	}
  }
  output_path = "tmp/lambda/${var.function_name}.zip"
}

resource "aws_lambda_function" "main" {

  tags = merge(map("Name", var.project), var.tags, var.extra_tags)
  count                           = var.executions

  function_name                   = var.function_name
  filename                        = data.archive_file.lambda-zip-file.output_path
  handler                         = var.handler
  role                            = module.iam_lambda_role.main[0].arn
  description                     = var.description == "" ? var.project : var.description
  layers                          = var.layers
  memory_size                     = var.memory_size
  runtime                         = var.runtime
  timeout                         = var.timeout
  reserved_concurrent_executions  = var.reserved_concurrent_executions
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
  publish                         = var.publish
  kms_key_arn                     = var.kms_key_arn
  source_code_hash                = data.archive_file.lambda-zip-file.output_base64sha256
}
