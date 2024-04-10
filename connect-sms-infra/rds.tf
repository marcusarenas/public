 module "rds" {
     source                                = "git::https://github.com/developer-productivity/aws-resources-modules.git//db_instance"

     project                               = var.project
     environment                           = var.environment
     tags                                  = var.tags
     module_tags                           = var.module_tags
     executions                            = var.executions

     allocated_storage                     = lookup(var.allocated_storage, var.environment)
     apply_immediately                     = lookup(var.apply_immediately, var.environment)
     auto_minor_version_upgrade            = var.auto_minor_version_upgrade
     backup_retention_period               = lookup(var.backup_retention_period, var.environment)
     backup_window                         = lookup(var.backup_window, var.environment)
     ca_cert_identifier                    = lookup(var.ca_cert_identifier, var.environment)
     copy_tags_to_snapshot                 = lookup(var.copy_tags_to_snapshot, var.environment)
     //db_subnet_group_name                = lookup(var.db_subnet_group, var.environment)
     db_subnet_group_name                  = module.db_subnet_group.main[0].id
     deletion_protection                   = lookup(var.deletion_protection, var.environment)
     engine                                = var.engine
     engine_version                        = lookup(var.engine_version, var.environment)
     final_snapshot_identifier             = format("%s-%s-%s-%s", "fs", replace(var.project, "_", "-"), var.environment, formatdate("DDMMMYYYYhh24mm", timestamp()))
     identifier                            = format("%s-%s", replace(var.project, "_", "-"), var.environment)
     instance_class                        = lookup(var.instance_class, var.environment)
     maintenance_window                    = lookup(var.maintenance_window, var.environment)
     max_allocated_storage                 = lookup(var.max_allocated_storage, var.environment)
     multi_az                              = lookup(var.multi_az, var.environment)
     name                                  = var.name
     parameter_group_name                  = lookup(var.parameter_group_name, var.environment)
     password                              = jsondecode(data.aws_secretsmanager_secret_version.root_credentials.secret_string)["password"]     
     port                                  = var.port
     skip_final_snapshot                   = lookup(var.skip_final_snapshot, var.environment)
     storage_encrypted                     = lookup(var.storage_encrypted, var.environment)
     storage_type                          = lookup(var.storage_type, var.environment)
     username                              = jsondecode(data.aws_secretsmanager_secret_version.root_credentials.secret_string)["username"] 
     vpc_security_group_ids                = [module.pagseguro_rds_security_group.main[0].id]
     performance_insights_enabled          = lookup(var.performance_insights_enabled, var.environment)
     performance_insights_retention_period = lookup(var.performance_insights_retention_period, var.environment) 
 }