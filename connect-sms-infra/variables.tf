###################################
#PREENCHIMENTO MINIMO OBRIGATORIO#
###################################

#######
#TAGS#
#######

variable "tags" {
  default = {
    BusinessUnit        = "apiplatform"
    CriticalLevel       = 9
    Email               = "l-pagseguro-sao-petersburgo@uolinc.com"
    EscalationList      = "l-pagseguro-berlim"
    FilaIm              = "l-pagseguro-berlim"
    Product             = "connect-sms-api"
    Slack               = "sao-petersburgo-alert"
    Team                = "Sao Petersburgo"
    ApplicationRole     = "Banco de Dados"
    Domain              = "digitalcommerce"
    #SubDomain           = ""
    TopDomain           = "psp"
    CC                  = 11498
    ReliabilityEngineer = "ec-berlim"
  }
}

variable "extra_tags" {
  default = {
    PrivateTeamSlack         = "sao-petersburgo"
    CreatorTeam              = "berlim"
  }
}

variable "module_tags" {
  default = {
    IsLGPD                            = "false"
    IsPCI                             = "false"
    IsGDPR                            = "false"
    IsPII                             = "true"
    IsBACEN                           = "false"
    IsSOX                             = "false"
    IsANBIMA                          = "false"
    IsStrategicFinancial              = "false"
    IsNotSecurityApply                = "false"
    IsBankingSecrecy                  = "false"
    IsStrategicOperational            = "false"
    Active                            = "true"
    BusinessDescription               = ""
    StrategicSecrecy                  = "false"
  }
}

variable "active" {
  default = true
}

variable "business_description" {
  default = ""
}

variable "is_pci" {
  default = {
              dev          = false
              qa           = false
              sandbox-qa   = false
              prod         = false
              sandbox-prod = false
              api-qa       = false
              api-dev      = false
              api-sandbox-prod = false
              api-prod     = false
            }
}

variable "is_pii" {
  default = {
              dev          = true
              qa           = true
              sandbox-qa   = true
              prod         = true
              sandbox-prod = true
              api-qa       = true
              api-dev      = true
              api-sandbox-prod = true
              api-prod     = true
            }
}

variable "banking_secrecy" {
  default = {
              dev          = false
              qa           = false
              sandbox-qa   = false
              prod         = false
              sandbox-prod = false
              api-qa       = false
              api-dev      = false
              api-sandbox-prod = false
              api-prod     = false
            }
}

variable "strategic_secrecy" {
  default = {
              dev          = false
              qa           = false
              sandbox-qa   = false
              prod         = false
              sandbox-prod = false
              api-qa       = false
              api-dev      = false
              api-sandbox-prod = false
              api-prod     = false
            }
}

variable "sox" {
  default = {
              dev          = false
              qa           = false
              sandbox-qa   = false
              prod         = false
              sandbox-prod = false
              api-qa       = false
              api-dev      = false
              api-sandbox-prod = false
              api-prod     = false
            }
}

#####################
#DEMAIS PARAMETROS#
#####################

############################################
#DEMAIS PARAMETROS RECEBIDOS PELO JENKINS#
###########################################

variable "project" {
  default = "connect-sms"
}

##############################
#CANAIS DE COMUNICACAO SLACK#
##############################

variable "ad_slack" {
  default = "digital-payments-rds-costs"
}

variable "dba_slack" {
  default = ""
}

variable "info_slack_channels" {
  default = ["digital-payments-rds-costs"]
}

########################################
#PARAMTRO DE CRIAÇÃO/DESTRUIÇÃO DE BASE#
# 1 - CRIAÇÃO #
# 0 - EXCLUSÃO #
#########################################

variable "executions" {
  default = 1
}

########
#GLOBAL#
########

variable "environment" {
}

variable "region" {
  default = {
              dev          = "us-east-1"
              qa           = "us-east-1"
              sandbox-qa   = "us-east-1"
              prod         = "sa-east-1"
              sandbox-prod = "us-east-1"
              api-qa       = "us-east-1"
              api-dev      = "us-east-1"
              api-sandbox-prod = "us-east-1"
              api-prod     = "sa-east-1"
  }
}

variable "profile" {
  default = {
              dev          = "pagseguro-dev"
              qa           = "pagseguro-dev"
              sandbox-qa   = "pagseguro-dev"
              prod         = "pagseguro-prod"
              sandbox-prod = "pagseguro-prod"
              api-qa       = "pagseguro-dev"
              api-dev      = "pagseguro-dev"
              api-sandbox-prod = "pagseguro-prod"
              api-prod     = "pagseguro-prod"
  }
}

variable "account" {
  default = {
              dev          = "898139803216"
              qa           = "898139803216"
              sandbox-qa   = "898139803216"
              prod         = "360706934225"
              sandbox-prod = "360706934225"
              api-qa       = "207886776780"
              api-dev      = "108775912810"
              api-sandbox-prod = "161712559242"
              api-prod     = "161712559242"
              
  }
}


#######
# RDS #
#######

variable "allocated_storage" {
  default = {
    dev          = 20
    qa           = 20
    sandbox-qa   = 20
    prod         = 100
    sandbox-prod = 20
    api-qa       = 20
    api-dev      = 20
    api-sandbox-prod = 20
    api-prod     = 100
  }
}

variable "apply_immediately" {
  default = {
    dev          = true
    qa           = true
    sandbox-qa   = true
    prod         = true
    sandbox-prod = true
    api-qa       = true
    api-dev      = true
    api-sandbox-prod = true
    api-prod     = true
  }
}

variable "auto_minor_version_upgrade" {
  type    = bool
  default = false
}

variable "backup_retention_period" {
  default = {
    dev           = 2
    qa            = 2
    sandbox-qa    = 2
    prod          = 7
    sandbox-prod  = 7
    api-qa        = 2
    api-dev       = 2
    api-sandbox-prod = 7
    api-prod      = 7
  }
}

variable "backup_window" {
  default = {
    dev           = "08:00-09:00"
    qa            = "08:00-09:00"
    sandbox-qa    = "08:00-09:00"
    prod          = "00:00-04:00"
    sandbox-prod  = "00:00-04:00"
    api-qa        = "08:00-09:00"
    api-dev       = "08:00-09:00"
    api-sandbox-prod = "00:00-04:00"
    api-prod      = "00:00-04:00"
  }
}

variable "ca_cert_identifier" {
  default = {
    dev           = "rds-ca-2019"
    qa            = "rds-ca-2019"
    sandbox-qa    = "rds-ca-2019"
    prod          = "rds-ca-2019"
    sandbox-prod  = "rds-ca-2019"
    api-qa        = "rds-ca-2019"
    api-dev       = "rds-ca-2019"
    api-sandbox-prod = "rds-ca-2019"
    api-prod      = "rds-ca-2019"
  }
}

variable "copy_tags_to_snapshot" {
  default = {
    dev           = true
    qa            = true
    sandbox-qa    = true
    prod          = true
    sandbox-prod  = true
    api-qa        = true
    api-dev       = true
    api-sandbox-prod = true
    api-prod      = true
  }
}

variable "db_subnet_group" {
  default = {
    dev          = "db-pagseguro-subnetgroup"
    qa           = "db-pagseguro-subnetgroup"
    sandbox-qa   = "db-pagseguro-subnetgroup"
    prod         = "db-pagseguro-subnetgroup"
    sandbox-prod = "db-pagseguro-subnetgroup"
    #api-qa       = "db-pagseguro-subnetgroup"
    #api-dev      = "db-pagseguro-subnetgroup"
    api-sandbox-prod = "db-pagseguro-subnetgroup"
    #api-prod     = "db-pagseguro-subnetgroup"
  }
}

variable "subnet_ids" {
  default = {
    api-qa            = ["subnet-02589ae576fda7014", "subnet-067c087397ec133af"]
    api-dev           = ["subnet-0106133f2c3e55cea", "subnet-0fe73baa554ac898c"]
    api-sandbox-prod  = ["subnet-034c15137c20a3588", "subnet-0390f3053826e7dd5"]
    #api-prod          = ["", ""]
  }
}

variable "deletion_protection" {
  default = {
    dev          = false
    qa           = false
    sandbox-qa   = false
    prod         = true
    sandbox-prod = true
    api-qa       = false
    api-dev      = false
    api-sandbox-prod = true
    api-prod     = true
  }
}

variable "instance_class" {
  default = {
    dev          = "db.t3.small"
    qa           = "db.t3.small"
    sandbox-qa   = "db.t3.small"
    prod         = "db.t3.medium"
    sandbox-prod = "db.t3.medium"
    api-qa       = "db.t3.small"
    api-dev      = "db.t3.small"
    api-sandbox-prod = "db.t3.medium"
    api-prod     = "db.t3.medium"
  }
}

variable "maintenance_window" {
  default = {
    dev           = "mon:05:00-mon:07:30"
    qa            = "mon:05:00-mon:07:30"
    sandbox-qa    = "mon:05:00-mon:07:30"
    prod          = "mon:05:00-mon:07:30"
    sandbox-prod  = "mon:05:00-mon:07:30"
    api-qa        = "mon:05:00-mon:07:30"
    api-dev       = "mon:05:00-mon:07:30"
    api-sandbox-prod = "mon:05:00-mon:07:30"
    api-prod      = "mon:05:00-mon:07:30"
  }
}

variable "max_allocated_storage" {
  default = {
    dev          = 5120
    qa           = 5120
    sandbox-qa   = 5120
    prod         = 5120
    sandbox-prod = 5120
    api-qa       = 5120
    api-dev      = 5120
    api-sandbox-prod = 5120
    api-prod     = 5120
  }
}
 
variable "monitoring_interval" {
  default = {
    dev           = 0
    qa            = 0
    sandbox-qa    = 0
    prod          = 0
    sandbox-prod  = 0
    api-qa        = 0
    api-dev       = 0
    api-sandbox-prod = 0
    api-prod      = 0
  }
}

variable "monitoring_role" {
  default = {
    dev           = "pagseguroTerraformRdsCloudwatchLogsDevRole"
    qa            = "pagseguroTerraformRdsCloudwatchLogsDevRole"
    sandbox-qa    = "pagseguroTerraformRdsCloudwatchLogsDevRole"
    prod          = "pagseguroTerraformRdsCloudwatchLogsProdRole"
    sandbox-prod  = "pagseguroTerraformRdsCloudwatchLogsProdRole"
    api-qa        = "pagseguroTerraformRdsCloudwatchLogsApiQARole"
    api-dev       = "pagseguroTerraformRdsCloudwatchLogsApiDevRole"
    api-sandbox-prod = "pagseguroTerraformRdsCloudwatchLogsApiSdbxProdRole"
    api-prod      = "pagseguroTerraformRdsCloudwatchLogsApiProdRole"
  }
}

variable "multi_az" {
  default = {
    dev          = false
    qa           = false
    sandbox-qa   = false
    prod         = true
    sandbox-prod = true
    api-qa       = false
    api-dev      = false
    api-sandbox-prod = true
    api-prod     = true
  }
}

variable "skip_final_snapshot" {
  default = {
    dev          = true
    qa           = true
    sandbox-qa   = true
    prod         = false
    sandbox-prod = false
    api-qa       = true
    api-dev      = true
    api-sandbox-prod = false
    api-prod     = false
  }
}


variable "storage_encrypted" {
  default = {
    dev          = true
    qa           = true
    sandbox-qa   = true
    prod         = true
    sandbox-prod = true
    api-qa       = true
    api-dev      = true
    api-sandbox-prod = true
    api-prod     = true
  }
}

variable "storage_type" {
  default = {
    dev          = "gp2"
    qa           = "gp2"
    sandbox-qa   = "gp2"
    prod         = "gp2"
    sandbox-prod = "gp2"
    api-qa       = "gp3"
    api-dev      = "gp3"
    api-sandbox-prod = "gp3"
    api-prod     = "gp3"
  }
}

variable "name" {
  default = "connsms"
}

variable "engine" {
  default = "mysql"
}

variable "engine_version" {
  default = {
    dev          = "8.0.20"
    qa           = "8.0.20"
    sandbox-qa   = "8.0.20"
    prod         = "8.0.20"
    sandbox-prod = "8.0.20"
    api-qa       = "8.0.23"
    api-dev      = "8.0.20"
    api-sandbox-prod = "8.0.23"
    api-prod     = "8.0.23"
  }
}

variable "parameter_group_name" {
  default = {
    dev          = "default.mysql8.0"
    qa           = "default.mysql8.0"
    sandbox-qa   = "default.mysql8.0"
    prod         = "default.mysql8.0"
    sandbox-prod = "default.mysql8.0"
    api-qa       = "default.mysql8.0"
    api-dev      = "default.mysql8.0"
    api-sandbox-prod = "default.mysql8.0"
    api-prod     = "default.mysql8.0"
  }
}


variable "port" {
  default = 3306
}


variable "performance_insights_enabled" {
  default = {
    dev          = false
    qa           = false
    sandbox-qa   = false
    prod         = true
    sandbox-prod = true
    api-qa       = false
    api-dev      = false
    api-sandbox-prod = true
    api-prod     = true
  }
}

variable "performance_insights_retention_period" {
  default = {
    dev          = 0
    qa           = 0
    sandbox-qa   = 0
    prod         = 7
    sandbox-prod = 7
    api-qa       = 0
    api-dev      = 0
    api-sandbox-prod = 7
    api-prod     = 7
  }
}

#######
# VPC #
#######

variable "vpc" {
  default = {
    dev          = "pagseg-stage-q&a"
    qa           = "pagseg-stage-q&a"
    sandbox-qa   = "pagseg-stage-q&a"
    prod         = "prod"
    sandbox-prod = "Pagseguro-Prod"
    api-qa       = "Vpc"
    api-dev      = "Vpc"
    api-sandbox-prod = "Vpc"
    api-prod     = "Vpc"
  }
}

variable "sg_ecs" {
  default = {
    dev          = "digital-payments_ec2"
    qa           = "digital-payments_ec2"
    sandbox-qa   = "sandbox_ec2"
    prod         = "digital-payments_ec2"
    sandbox-prod = "sandbox_ec2"
    api-qa       = "api-ecs-cluster_ec2"
    api-dev      = "api-ecs-cluster_ec2"
    api-sandbox-prod = "api-sandbox-ecs-cluster_ec2"
    api-prod     = "api-ecs-cluster_ec2"
  }
}

##################
# SECRET MANAGER #
##################

variable "secret_manager_root" {
  default = {
    dev          = "dev/oracle/RdsRootUserCredentials/"
    qa           = "dev/oracle/RdsRootUserCredentials/"
    sandbox-qa   = "dev/oracle/RdsRootUserCredentials/"
    prod         = "prod/oracle/RdsRootUserCredentials/"
    sandbox-prod = "sandbox-prod/oracle/RdsRootUserCredentials/"
    api-qa       = "qa/oracle/RdsRootUserCredentials/"
    api-dev      = "dev/oracle/RdsRootUserCredentials/"
    api-sandbox-prod = "sandbox-prod/oracle/RdsRootUserCredentials/"
    api-prod     = "prod/oracle/RdsRootUserCredentials/"
  }
}

variable "ssm_parameter_name"{
  default = {
    api-qa       = "/config/digital-payments/batseguro/BATSEGURO_KEY_API_QA_CONNECT_SMS_API"
    api-dev      = "/config/digital-payments/batseguro/BATSEGURO_KEY_API_DEV_CONNECT_SMS_API"
    api-sandbox-prod = "/config/digital-payments/batseguro/BATSEGURO_KEY_API_SDBX_PRD_CONNECT_SMS_API"
    api-prod     = "/config/digital-payments/batseguro/BATSEGURO_KEY_API_PRD_CONNECT_SMS_API"
  }
}

###########
# ROUTE53 #
###########

variable "zone_id" {
  default = {
    dev          = "Z14HVCXFCIKB6"
    qa           = "Z14HVCXFCIKB6"
    sandbox-qa   = "Z14HVCXFCIKB6"
    prod         = "Z3SC3IY353BLEP"
    sandbox-prod = "Z3SC3IY353BLEP"
    api-qa       = "Z0119347EJC0EQZ4V4W0"
    api-dev      = "Z01202532B2XLRSOTR5ZW"
    api-sandbox-prod = "Z01722932MZBAG1340D7U"
    api-prod     = "Z04664131X53ZA3BIXHKL"
  }
}

variable "zone_name" {
  default = {
    dev           = "connect-sms.dev.rds"
    qa            = "connect-sms.qa.rds"
    sandbox-qa    = "connect-sms.sandbox-qa.rds"
    prod          = "connect-sms.prod.rds"
    sandbox-prod  = "connect-sms.sandbox-prod.rds"
    api-qa        = "connect-sms.qa.rds"
    api-dev       = "connect-sms.dev.rds"
    api-sandbox-prod = "api.sandbox.aws.pagseguro.uol"
    api-prod      = "connect-sms.prod.rds"
  }
}

variable "zone_type" {
  default = {
    dev          = "CNAME"
    qa           = "CNAME"
    sandbox-qa   = "CNAME"
    prod         = "CNAME"
    sandbox-prod = "CNAME"
    api-qa       = "CNAME"
    api-dev      = "CNAME"
    api-sandbox-prod = "CNAME"
    api-prod     = "CNAME"
  }
}

variable "zone_ttl" {
  default = {
    dev          = 300
    qa           = 300
    sandbox-qa   = 300
    prod         = 300
    sandbox-prod = 300
    api-qa       = 300
    api-dev      = 300
    api-sandbox-prod = 300
    api-prod     = 300
  }
}

variable "records" {
  default = {
    dev           = "connect-sms-dev.cugpk8fsjek9.us-east-1.rds.amazonaws.com"
    qa            = "connect-sms-qa.cugpk8fsjek9.us-east-1.rds.amazonaws.com"
    sandbox-qa    = "connect-sms-sandbox-qa.cugpk8fsjek9.us-east-1.rds.amazonaws.com"
    prod          = "connect-sms-prod.coid1xsnbqhf.sa-east-1.rds.amazonaws.com"
    sandbox-prod  = "connect-sms-sandbox-prod.c9z77rsfata9.us-east-1.rds.amazonaws.com"
    api-qa        = "connect-sms-api-qa.capnqjobub1u.us-east-1.rds.amazonaws.com"
    api-dev       = "connect-sms-api-qa.capnqjobub1u.us-east-1.rds.amazonaws.com"
    api-sandbox-prod = "connect-sms-api-sandbox-prod.cb5svbtdbpp7.us-east-1.rds.amazonaws.com"
    api-prod      = "connect-sms-api-prod.cyc1ncvr1gi7.sa-east-1.rds.amazonaws.com"
  }
}
