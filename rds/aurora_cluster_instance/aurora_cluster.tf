resource "aws_rds_cluster_instance" "aurora_cluster_instance" {
  count                        			= var.executions
  apply_immediately            			= var.apply_immediately
  auto_minor_version_upgrade   			= var.auto_minor_version_upgrade
  availability_zone            			= var.availability_zone
  cluster_identifier           			= var.cluster_identifier
  preferred_backup_window      			= var.preferred_backup_window
  performance_insights_enabled 			= var.performance_insights_enabled
  performance_insights_kms_key_id 	= var.performance_insights_kms_key_id
# performance_insights_retention_period = var.performance_insights_retention_period
  copy_tags_to_snapshot             = var.copy_tags_to_snapshot
  ca_cert_identifier                = var.ca_cert_identifier
  engine                       			= var.engine
  engine_version               			= var.engine_version
  identifier                   			= format("%s-%s-%s", var.project, var.environment, count.index)
  identifier_prefix            			= var.identifier_prefix
  instance_class               			= var.instance_class
  publicly_accessible          			= var.publicly_accessible
  db_subnet_group_name         			= var.db_subnet_group_name
  db_parameter_group_name      			= var.db_parameter_group_name
  monitoring_role_arn          			= var.monitoring_role_arn
  monitoring_interval          			= var.monitoring_interval
  preferred_maintenance_window 			= var.preferred_maintenance_window
  promotion_tier               			= (var.promotion_tier + count.index)
  tags                              = merge(var.tags,var.extra_tags, var.module_tags, { 		
	name								= format("%s-Aurora-DB-Instance-%s",var.project,var.environment) 
	})
  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      create = timeouts.value["create"]
      delete = timeouts.value["delete"]
      update = timeouts.value["update"]
    }
  }
}