variable "rds_cluster_identifier" {
  description = "Unique identifier of the existing Aurora RDS cluster."
  type        = string
  default     = "tfefdo-aurorapgsql-dr-testing"
}

variable "rds_engine" {
  description = "Aurora database engine."
  type        = string
  default     = "aurora-postgresql"
}

variable "rds_engine_version" {
  description = "Aurora PostgreSQL engine version."
  type        = string
  default     = "14.20"
}

variable "rds_engine_mode" {
  description = "Aurora cluster engine mode."
  type        = string
  default     = "provisioned"
}

variable "rds_database_name" {
  description = "Initial database name."
  type        = string
  default     = "tfe"
}

variable "rds_availability_zones" {
  description = "Availability Zones used by the Aurora cluster."
  type        = list(string)
  default = [
    "eu-west-1a",
    "eu-west-1b",
    "eu-west-1c"
  ]
}

variable "rds_db_subnet_group_name" {
  description = "RDS DB subnet group."
  type        = string
  default     = "novartisrdrar27devie-tfefdo-aurorapgsql"
}

variable "rds_db_cluster_parameter_group_name" {
  description = "Aurora cluster parameter group."
  type        = string
  default     = "tfe-database-cluster-parameter-group-20240410083706931500000002"
}

variable "rds_db_parameter_group_name" {
  description = "Aurora instance parameter group."
  type        = string
  default     = "tfe-database-parameter-group-20240410083706931000000001"
}

variable "rds_backup_retention_period" {
  description = "Number of days to retain automated backups."
  type        = number
  default     = 35
}

variable "rds_backtrack_window" {
  description = "Aurora Backtrack window in seconds."
  type        = number
  default     = 0
}

variable "rds_copy_tags_to_snapshot" {
  description = "Whether cluster tags are copied to snapshots."
  type        = bool
  default     = true
}

variable "rds_delete_automated_backups" {
  description = "Whether automated backups are deleted with the cluster."
  type        = bool
  default     = true
}

variable "rds_deletion_protection" {
  description = "Whether deletion protection is enabled."
  type        = bool
  default     = false
}

variable "rds_enable_global_write_forwarding" {
  description = "Whether global write forwarding is enabled."
  type        = bool
  default     = false
}

variable "rds_enable_http_endpoint" {
  description = "Whether the Aurora HTTP endpoint is enabled."
  type        = bool
  default     = false
}

variable "rds_enable_local_write_forwarding" {
  description = "Whether local write forwarding is enabled."
  type        = bool
  default     = false
}

variable "rds_enabled_cloudwatch_logs_exports" {
  description = "CloudWatch log exports enabled for Aurora."
  type        = list(string)
  default     = []
}

variable "rds_iam_database_authentication_enabled" {
  description = "Whether IAM database authentication is enabled."
  type        = bool
  default     = false
}

variable "rds_kms_key_id" {
  description = "KMS key ARN used for RDS storage encryption."
  type        = string
  default     = "arn:aws:kms:eu-west-1:499998932841:key/c35a8f23-deb8-4b21-bb8c-182b6d5aa431"
}

variable "rds_master_username" {
  description = "Master username for the Aurora cluster."
  type        = string
  default     = "tfe_aws_postgres"
  sensitive   = true
}

variable "rds_port" {
  description = "Aurora PostgreSQL port."
  type        = number
  default     = 5432
}

variable "rds_preferred_backup_window" {
  description = "Preferred Aurora backup window."
  type        = string
  default     = "04:00-04:30"
}

variable "rds_preferred_maintenance_window" {
  description = "Preferred Aurora cluster maintenance window."
  type        = string
  default     = "sun:08:00-sun:09:00"
}

variable "rds_skip_final_snapshot" {
  description = "Whether to skip the final snapshot on deletion."
  type        = bool
  default     = true
}

variable "rds_storage_encrypted" {
  description = "Whether RDS storage encryption is enabled."
  type        = bool
  default     = true
}

variable "rds_vpc_security_group_ids" {
  description = "Security groups attached to the Aurora cluster."
  type        = list(string)
  default = [
    "sg-0aeec10ddf40e45ab"
  ]
}

variable "rds_instance_identifier" {
  description = "Unique identifier of the Aurora writer instance."
  type        = string
  default     = "tfefdo-aurorapgsql-dr-testing-0"
}

variable "rds_instance_class" {
  description = "Instance class for the Aurora writer."
  type        = string
  default     = "db.r6g.xlarge"
}

variable "rds_instance_availability_zone" {
  description = "Availability Zone of the Aurora writer instance."
  type        = string
  default     = "eu-west-1a"
}

variable "rds_auto_minor_version_upgrade" {
  description = "Whether automatic minor version upgrades are enabled."
  type        = bool
  default     = true
}

variable "rds_ca_cert_identifier" {
  description = "CA certificate identifier for the RDS instance."
  type        = string
  default     = "rds-ca-rsa2048-g1"
}

variable "rds_instance_copy_tags_to_snapshot" {
  description = "Whether instance tags are copied to snapshots."
  type        = bool
  default     = false
}

variable "rds_force_destroy" {
  description = "Whether the RDS instance can be forcefully destroyed."
  type        = bool
  default     = false
}

variable "rds_monitoring_interval" {
  description = "Enhanced Monitoring interval in seconds. Zero disables Enhanced Monitoring."
  type        = number
  default     = 0
}

variable "rds_performance_insights_enabled" {
  description = "Whether Performance Insights is enabled."
  type        = bool
  default     = false
}

variable "rds_performance_insights_kms_key_id" {
  description = "KMS key for Performance Insights."
  type        = string
  default     = null
}

variable "rds_performance_insights_retention_period" {
  description = "Performance Insights retention period. Used only when Performance Insights is enabled."
  type        = number
  default     = 7
}

variable "rds_instance_preferred_backup_window" {
  description = "Preferred backup window for the Aurora writer instance."
  type        = string
  default     = "04:00-04:30"
}

variable "rds_instance_preferred_maintenance_window" {
  description = "Preferred maintenance window for the Aurora writer instance."
  type        = string
  default     = "fri:00:14-fri:00:44"
}

variable "rds_promotion_tier" {
  description = "Failover priority tier for the Aurora writer."
  type        = number
  default     = 1
}

variable "rds_publicly_accessible" {
  description = "Whether the Aurora writer instance is publicly accessible."
  type        = bool
  default     = false
}

variable "rds_tags" {
  description = "Tags applied to the Aurora resources."
  type        = map(string)

  default = {
    BillingContact = "GUPTAA2E"
    ClarityID      = "054239"
    Environment    = "DEV"
    region         = "eu-west-1"
  }
}
