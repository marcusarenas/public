module "iam_lambda_role" {
  source              = "git::https://github.com/developer-productivity/aws-resources-modules.git//iam_role"

  executions          = var.executions
  project             = var.project
  environment         = var.environment
  tags                = var.tags

  name                = "${var.function_name}"
  assume_role_policy  = data.aws_iam_policy_document.iam_assume_role_policy_document.json
}

module "iam_lambda_role_policy" {
  source      = "git::https://github.com/developer-productivity/aws-resources-modules.git//iam_role_policy"

  executions  = var.executions
  project     = var.project
  environment = var.environment
  tags        = var.tags

  policy      = var.policy_statement
  role        = module.iam_lambda_role.main[0].id
}

module "iam_role_policy_attachment_AWSLambdaBasicExecutionRole" {
  source      = "git::https://github.com/developer-productivity/aws-resources-modules.git//iam_role_policy_attachment"

  executions  = var.executions
  project     = var.project
  environment = var.environment
  tags        = var.tags

  role        = module.iam_lambda_role.main[0].id
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}