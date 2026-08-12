variable "cluster_identifier" {
  description = "Unique identifier for the Aurora RDS cluster."
  type        = string
}

variable "engine" {
  description = "Database engine used by the Aurora cluster and cluster instance."
  type        = string
  default     = "aurora-postgresql"
}

variable "engine_version" {
  description = "Aurora PostgreSQL engine version."
  type        = string
  default     = "14.20"
}

variable "engine_mode" {
  description = "Engine mode for the Aurora cluster."
  type        = string
  default     = "provisioned"
}

variable "database_name" {
  description = "Name of the initial database created in the Aurora cluster."
  type        = string
  default     = null
}

variable "availability_zones" {
  description = "List of Availability Zones in which the Aurora cluster can create instances."
  type        = list(string)
  default     = null
}

variable "db_subnet_group_name" {
  description = "DB subnet group associated with the Aurora cluster and instances."
  type        = string
}

variable "db_cluster_parameter_group_name" {
  description = "Cluster parameter group associated with the Aurora cluster."
  type        = string
}

variable "db_parameter_group_name" {
  description = "DB parameter group associated with the Aurora cluster instance."
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "Number of days to retain automated backups for the Aurora cluster."
  type        = number
  default     = 1
}

variable "backtrack_window" {
  description = "Number of seconds to retain transaction logs for Aurora Backtrack."
  type        = number
  default     = 0
}

variable "copy_tags_to_snapshot" {
  description = "Whether cluster tags should be copied to snapshots."
  type        = bool
  default     = true
}

variable "delete_automated_backups" {
  description = "Whether automated backups should be deleted when the cluster is deleted."
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled for the Aurora cluster."
  type        = bool
  default     = false
}

variable "enable_global_write_forwarding" {
  description = "Whether global write forwarding is enabled for the Aurora cluster."
  type        = bool
  default     = false
}

variable "enable_http_endpoint" {
  description = "Whether the HTTP endpoint for the Aurora cluster is enabled."
  type        = bool
  default     = false
}

variable "enable_local_write_forwarding" {
  description = "Whether local write forwarding is enabled for the Aurora cluster."
  type        = bool
  default     = false
}

variable "enabled_cloudwatch_logs_exports" {
  description = "CloudWatch log types exported by the Aurora cluster."
  type        = list(string)
  default     = []
}

variable "iam_database_authentication_enabled" {
  description = "Whether IAM database authentication is enabled."
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "KMS key ARN or ID used to encrypt the Aurora cluster storage."
  type        = string
  default     = null
}

variable "master_username" {
  description = "Master username for the Aurora cluster."
  type        = string
  default     = null
  sensitive   = true
}

variable "port" {
  description = "Port on which the Aurora PostgreSQL cluster accepts connections."
  type        = number
  default     = 5432
}

variable "preferred_backup_window" {
  description = "Daily time range during which automated backups are created."
  type        = string
  default     = null
}

variable "preferred_maintenance_window" {
  description = "Weekly time range during which cluster maintenance can occur."
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Whether to skip creation of a final snapshot when the cluster is deleted."
  type        = bool
  default     = true
}

variable "storage_encrypted" {
  description = "Whether storage encryption is enabled for the Aurora cluster."
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "Security groups associated with the Aurora cluster."
  type        = list(string)
  default     = []
}

variable "instance_identifier" {
  description = "Unique identifier for the Aurora cluster instance."
  type        = string
}

variable "instance_class" {
  description = "Compute and memory class of the Aurora cluster instance."
  type        = string
  default     = "db.r6g.xlarge"
}

variable "instance_availability_zone" {
  description = "Availability Zone in which the Aurora cluster instance is created."
  type        = string
  default     = null
}

variable "auto_minor_version_upgrade" {
  description = "Whether automatic minor engine version upgrades are enabled."
  type        = bool
  default     = true
}

variable "ca_cert_identifier" {
  description = "CA certificate identifier used by the RDS instance."
  type        = string
  default     = null
}

variable "instance_copy_tags_to_snapshot" {
  description = "Whether instance tags are copied to snapshots."
  type        = bool
  default     = false
}

variable "force_destroy" {
  description = "Whether the RDS cluster instance can be forcefully destroyed."
  type        = bool
  default     = false
}

variable "monitoring_interval" {
  description = "Enhanced Monitoring interval in seconds. Set to 0 to disable Enhanced Monitoring."
  type        = number
  default     = 0
}

variable "performance_insights_enabled" {
  description = "Whether Performance Insights is enabled for the RDS instance."
  type        = bool
  default     = false
}

variable "performance_insights_kms_key_id" {
  description = "KMS key used to encrypt Performance Insights data."
  type        = string
  default     = null
}

variable "performance_insights_retention_period" {
  description = "Performance Insights retention period in days. Valid values are 7 or 731 when Performance Insights is enabled."
  type        = number
  default     = 7

  validation {
    condition     = contains([7, 731], var.performance_insights_retention_period)
    error_message = "Performance Insights retention period must be either 7 or 731 days."
  }
}

variable "instance_preferred_backup_window" {
  description = "Daily backup window for the Aurora cluster instance."
  type        = string
  default     = null
}

variable "instance_preferred_maintenance_window" {
  description = "Weekly maintenance window for the Aurora cluster instance."
  type        = string
  default     = null
}

variable "promotion_tier" {
  description = "Failover priority tier for the Aurora cluster instance."
  type        = number
  default     = 1
}

variable "publicly_accessible" {
  description = "Whether the Aurora cluster instance has a public IP address."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to the Aurora cluster and cluster instance."
  type        = map(string)
  default     = {}
}
