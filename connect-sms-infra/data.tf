#######
# VPC #
#######
data "aws_vpc" "main" {
  filter {
    name    = "tag:Name"
    values  = [lookup(var.vpc, var.environment)]
  }
}

data "aws_security_group" "sg_ecs" {
  count     = lookup(var.sg_ecs, var.environment) != null ? 1 : 0
  name      = lookup(var.sg_ecs, var.environment)
}



#######
# IAM #
#######

data "aws_iam_policy_document" "role" {
  statement {
    actions       = [
                      "sts:AssumeRole"
                    ]
    principals {
      type        = "Service"
      identifiers = [
                      "ecs-tasks.amazonaws.com"
                    ]
    }
  }
}

###################
# ECS ROLE POLICY #
###################

data "aws_iam_policy_document" "ecs_assume_role_policy" {
  statement {
    actions       = [
                      "sts:AssumeRole"
                    ]
    principals {
      type        = "Service"
      identifiers = [
                      "ecs-tasks.amazonaws.com"
                    ]
    }
  }
}

data "aws_iam_policy_document" "ecs_task_policy" {
  statement {
    effect = "Allow"

    resources = [
      format("arn:aws:secretsmanager:%s:%s:secret:%s/rds/%s/*", lookup (var.region, var.environment), lookup (var.account, var.environment), var.environment, var.project),
      "arn:aws:logs:${lookup(var.region, var.environment)}:${lookup(var.account, var.environment)}:log-group:/digital-payments/*",
      "arn:aws:logs:${lookup(var.region, var.environment)}:${lookup(var.account, var.environment)}:log-group:/digital-payments/*:*:*",
      "arn:aws:ssm:${lookup(var.region, var.environment)}:${lookup(var.account, var.environment)}:parameter/config/digital-payments/batseguro/*"
    ]

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "ssm:GetParameter",
      "ssm:ListParameter",
      "ssm:DescribeParameter",
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds"
    ]
  }

  statement {
     effect = "Allow"

     resources = [
      "arn:aws:ssm:${lookup(var.region, var.environment)}:${lookup(var.account, var.environment)}:parameter/config/digital-payments/batseguro/*",
      format("arn:aws:secretsmanager:%s:%s:secret:%s/rds/%s/*",lookup (var.region, var.environment),lookup (var.account, var.environment),var.environment,var.project),
      format("arn:aws:secretsmanager:%s:%s:secret:%s/rds/connect-sms/ubr*",lookup (var.region, var.environment),lookup (var.account, var.environment),var.environment),
      format("arn:aws:secretsmanager:%s:%s:secret:%s/rds/connect-sms/adm*",lookup (var.region, var.environment),lookup (var.account, var.environment),var.environment)
     #   module.secret_manager_connect_sms_ubr.main[0].arn
     ]

     actions = [
      "ssm:GetParameter",
      "ssm:ListParameter",
      "ssm:DescribeParameter",
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds",       
     ]
  }
}

##################
# SECRET MANAGER #
##################
data "aws_secretsmanager_secret" "root_secret" { 
  name = lookup(var.secret_manager_root, var.environment)
}

data "aws_secretsmanager_secret_version" "root_credentials" {
  secret_id = "${data.aws_secretsmanager_secret.root_secret.id}"
}