############
# ECS ROLE #
############

module "iam_role_ecs" {
  source              = "git::https://github.com/developer-productivity/aws-resources-modules.git//iam_role"

  executions            = var.executions

  project               = var.project
  environment           = var.environment
  tags                  = var.tags

  name                  = format("%sEcsCluster%sTasks", substr(var.environment, 0, 7) == "sandbox" ? "SandBox" : var.environment, replace(title(replace(replace(var.project, "-", " "), "_", " ")), " ", ""))
  assume_role_policy    = data.aws_iam_policy_document.ecs_assume_role_policy.json
}

module "iam_role_policy_ecs" {
  source      = "git::https://github.com/developer-productivity/aws-resources-modules.git//iam_role_policy"

  executions  = var.executions

  project     = var.project
  environment = var.environment
  tags        = var.tags

  policy      = data.aws_iam_policy_document.ecs_task_policy.json
  role        = var.executions != 0 ? module.iam_role_ecs.main[0].id : ""
}