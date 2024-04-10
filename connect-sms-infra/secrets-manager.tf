module "secret_manager_connect_sms_adm" {
  source                  = "git::https://github.com/developer-productivity/aws-resources-modules.git//secretsmanager_secret"

  name                    = format("%s/rds/%s/adm", var.environment, var.project)
  description             = format("Credenciais de acesso para o usuario ADM do banco %s", var.project)
  tags                    = var.tags
  project                 = var.project
  environment             = var.environment
  rotation_rules          = []
  kms_key_id              = null
}

module "secret_manager_connect_sms_ubr" {
  source                  = "git::https://github.com/developer-productivity/aws-resources-modules.git//secretsmanager_secret"

  name                    = format("%s/rds/%s/ubr", var.environment, var.project)
  description             = format("Credenciais de acesso para o usuario UBR do banco %s", var.project)
  tags                    = var.tags
  project                 = var.project
  environment             = var.environment
  rotation_rules          = []
  kms_key_id              = null
}


module "secret_manager_connect_sms_manut" {
  source                  = "git::https://github.com/developer-productivity/aws-resources-modules.git//secretsmanager_secret"

  name                    = format("%s/rds/%s/manut", var.environment, var.project)
  description             = format("Credenciais de acesso para o usuario MANUT do banco %s", var.project)
  tags                    = var.tags
  project                 = var.project
  environment             = var.environment
  rotation_rules          = []
  kms_key_id              = null
}

module "secret_manager_connect_sms_gov" {
  source                  = "git::https://github.com/developer-productivity/aws-resources-modules.git//secretsmanager_secret"

  name                    = format("%s/rds/%s/gov", var.environment, var.project)
  description             = format("Credenciais de acesso para o usuario GOV do banco %s", var.project)
  tags                    = var.tags
  project                 = var.project
  environment             = var.environment
  rotation_rules          = []
  kms_key_id              = null
}