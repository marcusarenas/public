######################
# RDS SECURITY GROUP #
######################

module "pagseguro_rds_security_group" {
  source      = "git::https://github.com/developer-productivity/aws-resources-modules.git//security_group"

  executions  = var.executions

  project     = var.project
  environment = var.environment
  tags        = var.tags

  name        = format("sg_pagseguro_rds_%s_%s", var.project, var.environment)
  vpc_id      = data.aws_vpc.main.id
}

module "pagseguro_rds_security_group_rule_egress" {
  source            = "git::https://github.com/developer-productivity/aws-resources-modules.git//security_group_rule"

  executions        = var.executions

  project           = var.project
  environment       = var.environment
  tags              = var.tags

  
  type              = "egress" 
  from_port         = 0
  to_port           = 0 
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = var.executions != 0 ? module.pagseguro_rds_security_group.main[0].id : ""
}

module "pagseguro_rds_security_group_rule_ingress_ec2" {
  source                   = "git::https://github.com/developer-productivity/aws-resources-modules.git//security_group_rule"

  executions               = var.sg_ecs != null ? var.executions : 0 
  
  project                  = var.project
  environment              = var.environment
  tags                     = var.tags

  description              = "Allow conection from EC2 instances to the Oracle RDS instance"
  type                     = "ingress"
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "tcp"
  source_security_group_id = var.sg_ecs != null ? "${data.aws_security_group.sg_ecs[0].id}" : "" 
  security_group_id        = var.executions != 0 ? module.pagseguro_rds_security_group.main[0].id : ""
}

module "pagseguro_rds_security_group_rule_ingress_jenkins" {
  source                   = "git::https://github.com/developer-productivity/aws-resources-modules.git//security_group_rule"

  executions               = var.executions
  
  project                  = var.project
  environment              = var.environment
  tags                     = var.tags

  description              = "Jenkins Access"
  type                     = "ingress"
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "tcp"
  cidr_blocks              = ["10.198.144.0/26"]
  security_group_id        = var.executions != 0 ? module.pagseguro_rds_security_group.main[0].id : ""
}

module "pagseguro_rds_security_group_rule_ingress_dev" {
  source                   = "git::https://github.com/developer-productivity/aws-resources-modules.git//security_group_rule"

  executions               = var.environment == "prod" || var.environment == "sandbox-prod" ? 0 : var.executions
  
  project                  = var.project
  environment              = var.environment
  tags                     = var.tags

  description              = "Pagseguro Network Access"
  type                     = "ingress"
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "tcp"
  cidr_blocks              = ["172.0.0.0/8", "10.196.0.0/16"]
  security_group_id        = var.executions != 0 ? module.pagseguro_rds_security_group.main[0].id : ""
  
}

module "pagseguro_rds_security_group_rule_ingress_jumpbox" {
  source                   = "git::https://github.com/developer-productivity/aws-resources-modules.git//security_group_rule"

  executions               = var.environment == "prod" || var.environment == "api-sandbox-prod" ? var.executions : 0
  
  project                  = var.project
  environment              = var.environment
  tags                     = var.tags

  description              = "Pagseguro Network Access on the Jumpbox"
  type                     = "ingress"
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "tcp"
  cidr_blocks              = [
                            "10.198.136.0/21",
                            "10.196.196.0/22",
                            "10.142.80.0/24",
                            "10.134.17.48/29",
                            "10.134.33.48/32",
                            "10.198.64.0/20",
                            "10.135.33.0/32",
                            "10.135.161.0/24",
                            "10.198.96.0/20",
                            "10.135.107.0/24",
                            "10.142.96.120/29",
                            "10.198.128.0/21",
                            "10.196.200.0/22",
                            "10.190.32.57/32",
                            "10.190.32.73/32",
                            "10.190.32.64/32",
                            "10.190.32.78/32",
                            "10.190.32.76/32",
                            "10.190.0.40/32",
                            "10.190.0.60/32",
                            "10.190.0.97/32",
                            "10.190.0.35/32",
                            "10.190.0.46/32"
                             ]
  security_group_id        = var.executions != 0 ? module.pagseguro_rds_security_group.main[0].id : ""
}

module "pagseguro_rds_security_group_rule_ingress_workspace" {
  source                   = "git::https://github.com/developer-productivity/aws-resources-modules.git//security_group_rule"

  executions               = var.executions
  
  project                  = var.project
  environment              = var.environment
  tags                     = var.tags

  description              = "Pagseguro Network Access on the Workspace"
  type                     = "ingress"
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "tcp"
  cidr_blocks              = [
                              "10.176.8.0/21",
                              "10.177.0.0/18",
                              "10.142.79.0/24", 
                              "10.204.0.0/18"
                              ]
  security_group_id        = var.executions != 0 ? module.pagseguro_rds_security_group.main[0].id : ""
}