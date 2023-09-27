##########
# GLOBAL #
##########

variable "executions" {
  type    = number
  default = 1
}

variable "project" {
  type  = string
}

variable "environment" {
  type  = string
}

variable "tags" {
  type = object({
    TopDomain       = string
    Domain          = string
    SubDomain       = string
    TopChannel      = string
    Channel         = string
    BusinessUnit    = string
    Product         = string
    Team            = string
    Slack           = string
    Email           = string
    CriticalLevel   = number
    ApplicationRole = string
  })
}


variable "extra_tags" {
  type    = map(any)
  default = {}
}


##########################
# AURORA CLUSTER INSTANCE #
##########################


# (Optional, Forces new resource) The identifier for the RDS instance, if omitted, Terraform will assign a random, unique identifier.
variable "identifier" {
  type = string
  default = null
}

# (Optional, Forces new resource) Creates a unique identifier beginning with the specified prefix. Conflicts with identifier
variable "identifier_prefix" {
  type = string
  default = null
}

# (Required, Forces new resource) The identifier of the aws_rds_cluster in which to launch this instance.
variable "cluster_identifier" {
  type = string
}

# (Optional, Forces new resource) The name of the database engine to be used for the RDS instance. Defaults to aurora. Valid Values: aurora, aurora-mysql, aurora-postgresql. For information on the difference between the available Aurora MySQL engines
variable "engine" {
  type = string
  default = null
}

# (Optional) The database engine version.
variable "engine_version" {
  type = string
  default = null
}

# (Required) The instance class to use. For details on CPU and memory, see Scaling Aurora DB Instances. Aurora uses db.* instance classes/types
variable "instance_class"{
  type = string
}

# (Optional) Bool to control if instance is publicly accessible. Default false
variable "publicly_accessible" {
  type = bool
  default = null
}

# (Required if publicly_accessible = false, Optional otherwise, Forces new resource) A DB subnet group to associate with this DB instance. NOTE: This must match the db_subnet_group_name of the attached aws_rds_cluster
variable "db_subnet_group_name" {
  type = string
  default = null
}

# (Optional) The name of the DB parameter group to associate with this instance
variable "db_parameter_group_name" {
  type = string
  default = null
}

# (Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default isfalse
variable "apply_immediately" {
  type = bool
  default = false
}

# (Optional) The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs
variable "monitoring_role_arn" {
  type    = string
  default = null
}

# (Optional) The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60
variable "monitoring_interval" {
  type    = number
  default = 0
}

# (Optional) Default 0. Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoter to writer.
variable "promotion_tier" {
  type = string
  default = 0
}

# (Optional, Computed) The EC2 Availability Zone that the DB instance is created in. See docs about the details.
variable "availability_zone" {
  type = string
  default = null
}

# (Optional) The daily time range during which automated backups are created if automated backups are enabled. Eg: "04:00-09:00".
variable "preferred_backup_window" {
  type = string
  default = null
}

# (Optional) The window to perform maintenance in. Syntax: "ddd:hh24:mi-ddd:hh24:mi". Eg: "Mon:00:00-Mon:03:00".
variable "preferred_maintenance_window" {
  type = string
  default = null
}

# (Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Default true.
variable "auto_minor_version_upgrade" {
  type = bool
  default = true
}

# (Optional) Specifies whether Performance Insights is enabled or not.
variable "performance_insights_enabled" {
  type    = bool
  default = false
}

# (Optional) ARN for the KMS key to encrypt Performance Insights data. When specifying performance_insights_kms_key_id, performance_insights_enabled needs to be set to true.
variable "performance_insights_kms_key_id" {
  type    = string
  default = null
}

# (Optional) Amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). When specifying performance_insights_retention_period, performance_insights_enabled needs to be set to true. Defaults to '7'.
variable "performance_insights_retention_period" {
  type    = number
  default = null
}

# (Optional, boolean) Indicates whether to copy all of the user-defined tags from the DB instance to snapshots of the DB instance. Default false.
variable "copy_tags_to_snapshot" {
  type    = bool
  default = false
}

#  (Optional) The identifier of the CA certificate for the DB instance.
variable "ca_cert_identifier" {
  type    = string
  default = null
}

variable "timeouts" {
  type = set(object(
    {
	create = string
    delete = string
    update = string
    }

  ))

  default = [
    {
	  create = "40m"
	  delete = "60m"
	  update = "80m"
    }
  ]
}