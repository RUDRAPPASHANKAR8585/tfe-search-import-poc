variable "rds_allocated_storage" {
  description = "Allocated storage for the RDS cluster."
  type        = number
  default     = 1
}

variable "rds_allow_major_version_upgrade" {
  description = "Whether major version upgrades are allowed."
  type        = bool
  default     = false
}

variable "rds_availability_zones" {
  description = "Availability Zones used by the RDS cluster."
  type        = list(string)

  default = [
    "eu-west-1a",
    "eu-west-1b",
    "eu-west-1c"
  ]
}

variable "rds_backtrack_window" {
  description = "Aurora Backtrack window in seconds."
  type        = number
  default     = 0
}

variable "rds_backup_retention_period" {
  description = "Automated backup retention period."
  type        = number
  default     = 35
}

variable "rds_cluster_identifier" {
  description = "RDS Aurora cluster identifier."
  type        = string
  default     = "tfefdo-aurorapgsql-dr-testing"
}

variable "rds_copy_tags_to_snapshot" {
  description = "Whether tags are copied to snapshots."
  type        = bool
  default     = true
}

variable "rds_database_insights_mode" {
  description = "Database Insights mode."
  type        = string
  default     = "standard"
}

variable "rds_database_name" {
  description = "Database name."
  type        = string
  default     = "tfe"
}

variable "rds_db_cluster_instance_class" {
  description = "RDS cluster instance class."
  type        = string
  default     = null
}

variable "rds_db_cluster_parameter_group_name" {
  description = "RDS cluster parameter group."
  type        = string
  default     = "tfe-database-cluster-parameter-group-20240410083706931500000002"
}

variable "rds_db_instance_parameter_group_name" {
  description = "RDS DB instance parameter group."
  type        = string
  default     = null
}

variable "rds_db_subnet_group_name" {
  description = "RDS DB subnet group."
  type        = string
  default     = "novartisrdrar27devie-tfefdo-aurorapgsql"
}

variable "rds_delete_automated_backups" {
  description = "Whether automated backups are deleted."
  type        = bool
  default     = true
}

variable "rds_deletion_protection" {
  description = "Whether deletion protection is enabled."
  type        = bool
  default     = false
}

variable "rds_domain" {
  description = "RDS Directory Service domain."
  type        = string
  default     = null
}

variable "rds_domain_iam_role_name" {
  description = "IAM role used for domain integration."
  type        = string
  default     = null
}

variable "rds_enable_global_write_forwarding" {
  description = "Whether global write forwarding is enabled."
  type        = bool
  default     = false
}

variable "rds_enable_http_endpoint" {
  description = "Whether the RDS HTTP endpoint is enabled."
  type        = bool
  default     = false
}

variable "rds_enable_local_write_forwarding" {
  description = "Whether local write forwarding is enabled."
  type        = bool
  default     = false
}

variable "rds_enabled_cloudwatch_logs_exports" {
  description = "CloudWatch Logs exported from RDS."
  type        = list(string)
  default     = []
}

variable "rds_engine" {
  description = "RDS database engine."
  type        = string
  default     = "aurora-postgresql"
}

variable "rds_engine_lifecycle_support" {
  description = "RDS engine lifecycle support setting."
  type        = string
  default     = "open-source-rds-extended-support-disabled"
}

variable "rds_engine_mode" {
  description = "Aurora engine mode."
  type        = string
  default     = "provisioned"
}

variable "rds_engine_version" {
  description = "Aurora PostgreSQL engine version."
  type        = string
  default     = "14.20"
}

variable "rds_final_snapshot_identifier" {
  description = "Final snapshot identifier."
  type        = string
  default     = null
}

variable "rds_global_cluster_identifier" {
  description = "Global cluster identifier."
  type        = string
  default     = null
}

variable "rds_iam_database_authentication_enabled" {
  description = "Whether IAM database authentication is enabled."
  type        = bool
  default     = false
}

variable "rds_iam_roles" {
  description = "IAM roles associated with the cluster."
  type        = list(string)
  default     = []
}

variable "rds_iops" {
  description = "Provisioned IOPS."
  type        = number
  default     = 0
}

variable "rds_kms_key_id" {
  description = "KMS key used for RDS encryption."
  type        = string
  default     = "arn:aws:kms:eu-west-1:499998932841:key/c35a8f23-deb8-4b21-bb8c-182b6d5aa431"
}

variable "rds_manage_master_user_password" {
  description = "Whether AWS manages the master password."
  type        = bool
  default     = null
}

variable "rds_master_password" {
  description = "Master password."
  type        = string
  default     = null
  sensitive   = true
}

variable "rds_master_password_wo" {
  description = "Write-only master password."
  type        = string
  default     = null
  sensitive   = true
}

variable "rds_master_password_wo_version" {
  description = "Write-only password version."
  type        = number
  default     = null
}

variable "rds_master_username" {
  description = "Master username."
  type        = string
  default     = "tfe_aws_postgres"
  sensitive   = true
}

variable "rds_monitoring_interval" {
  description = "Enhanced Monitoring interval."
  type        = number
  default     = 0
}

variable "rds_network_type" {
  description = "Network type."
  type        = string
  default     = "IPV4"
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
  description = "Performance Insights retention period."
  type        = number
  default     = 7
}

variable "rds_port" {
  description = "RDS PostgreSQL port."
  type        = number
  default     = 5432
}

variable "rds_preferred_backup_window" {
  description = "Preferred RDS backup window."
  type        = string
  default     = "04:00-04:30"
}

variable "rds_preferred_maintenance_window" {
  description = "Preferred RDS maintenance window."
  type        = string
  default     = "sun:08:00-sun:09:00"
}

variable "rds_region" {
  description = "AWS region for RDS."
  type        = string
  default     = "eu-west-1"
}

variable "rds_replication_source_identifier" {
  description = "Replication source identifier."
  type        = string
  default     = null
}

variable "rds_skip_final_snapshot" {
  description = "Whether the final snapshot is skipped."
  type        = bool
  default     = true
}

variable "rds_snapshot_identifier" {
  description = "Snapshot used to restore the cluster."
  type        = string
  default     = null
}

variable "rds_source_region" {
  description = "Source region for snapshot restoration."
  type        = string
  default     = null
}

variable "rds_storage_encrypted" {
  description = "Whether RDS storage is encrypted."
  type        = bool
  default     = true
}

variable "rds_tags" {
  description = "Tags applied to the RDS cluster."
  type        = map(string)

  default = {
    BillingContact = "GUPTAA2E"
    ClarityID      = "054239"
    Environment    = "DEV"
    region         = "eu-west-1"
  }
}

variable "rds_vpc_security_group_ids" {
  description = "Security groups attached to RDS."
  type        = list(string)

  default = [
    "sg-0aeec10ddf40e45ab"
  ]
}


# =========================================================
# RDS CLUSTER INSTANCE
# =========================================================

variable "rds_instance_auto_minor_version_upgrade" {
  description = "Whether automatic minor version upgrades are enabled."
  type        = bool
  default     = true
}

variable "rds_instance_availability_zone" {
  description = "Availability Zone of the RDS writer instance."
  type        = string
  default     = "eu-west-1a"
}

variable "rds_instance_ca_cert_identifier" {
  description = "CA certificate identifier."
  type        = string
  default     = "rds-ca-rsa2048-g1"
}

variable "rds_instance_copy_tags_to_snapshot" {
  description = "Whether instance tags are copied to snapshots."
  type        = bool
  default     = false
}

variable "rds_custom_iam_instance_profile" {
  description = "Custom IAM instance profile."
  type        = string
  default     = null
}

variable "rds_instance_db_parameter_group_name" {
  description = "DB parameter group for the writer instance."
  type        = string
  default     = "tfe-database-parameter-group-20240410083706931000000001"
}

variable "rds_instance_db_subnet_group_name" {
  description = "DB subnet group for the writer instance."
  type        = string
  default     = "novartisrdrar27devie-tfefdo-aurorapgsql"
}

variable "rds_instance_engine" {
  description = "Engine used by the writer instance."
  type        = string
  default     = "aurora-postgresql"
}

variable "rds_instance_engine_version" {
  description = "Engine version used by the writer instance."
  type        = string
  default     = "14.20"
}

variable "rds_force_destroy" {
  description = "Whether the RDS writer instance can be forcefully destroyed."
  type        = bool
  default     = false
}

variable "rds_instance_identifier" {
  description = "Writer instance identifier."
  type        = string
  default     = "tfefdo-aurorapgsql-dr-testing-0"
}

variable "rds_instance_class" {
  description = "RDS writer instance class."
  type        = string
  default     = "db.r6g.xlarge"
}

variable "rds_instance_monitoring_interval" {
  description = "Enhanced Monitoring interval for the writer."
  type        = number
  default     = 0
}

variable "rds_monitoring_role_arn" {
  description = "IAM role ARN for Enhanced Monitoring."
  type        = string
  default     = null
}

variable "rds_instance_performance_insights_enabled" {
  description = "Whether Performance Insights is enabled for the writer."
  type        = bool
  default     = false
}

variable "rds_instance_performance_insights_kms_key_id" {
  description = "KMS key for writer Performance Insights."
  type        = string
  default     = null
}

variable "rds_instance_performance_insights_retention_period" {
  description = "Performance Insights retention period for the writer."
  type        = number
  default     = 7
}

variable "rds_instance_preferred_backup_window" {
  description = "Preferred backup window for the writer."
  type        = string
  default     = "04:00-04:30"
}

variable "rds_instance_preferred_maintenance_window" {
  description = "Preferred maintenance window for the writer."
  type        = string
  default     = "fri:00:14-fri:00:44"
}

variable "rds_promotion_tier" {
  description = "Promotion priority tier."
  type        = number
  default     = 1
}

variable "rds_publicly_accessible" {
  description = "Whether the writer is publicly accessible."
  type        = bool
  default     = false
}

variable "rds_instance_tags" {
  description = "Tags applied to the writer instance."
  type        = map(string)
  default     = {}
}
