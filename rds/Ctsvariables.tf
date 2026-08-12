variable "allocated_storage" {
  description = "Amount of storage in GiB allocated to the RDS cluster. Required for Multi-AZ DB clusters."
  type        = number
  default     = null
}

variable "allow_major_version_upgrade" {
  description = "Whether major engine version upgrades are allowed."
  type        = bool
  default     = false
}

variable "availability_zones" {
  description = "List of Availability Zones for the RDS cluster."
  type        = list(string)
  default     = null
}

variable "backtrack_window" {
  description = "Number of seconds for the Aurora Backtrack window."
  type        = number
  default     = 0
}

variable "backup_retention_period" {
  description = "Number of days to retain automated backups."
  type        = number
  default     = 1
}

variable "cluster_identifier" {
  description = "Unique identifier for the RDS cluster."
  type        = string
}

variable "copy_tags_to_snapshot" {
  description = "Whether cluster tags are copied to snapshots."
  type        = bool
  default     = false
}

variable "database_insights_mode" {
  description = "Database Insights mode for the RDS cluster."
  type        = string
  default     = null
}

variable "database_name" {
  description = "Name of the initial database created in the cluster."
  type        = string
  default     = null
}

variable "db_cluster_instance_class" {
  description = "Instance class used by an RDS Multi-AZ DB cluster."
  type        = string
  default     = null
}

variable "db_cluster_parameter_group_name" {
  description = "Cluster parameter group associated with the RDS cluster."
  type        = string
  default     = null
}

variable "db_instance_parameter_group_name" {
  description = "Instance parameter group associated with the RDS cluster."
  type        = string
  default     = null
}

variable "db_subnet_group_name" {
  description = "DB subnet group associated with the RDS cluster."
  type        = string
  default     = null
}

variable "delete_automated_backups" {
  description = "Whether automated backups are deleted when the cluster is deleted."
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled."
  type        = bool
  default     = false
}

variable "domain" {
  description = "Directory Service domain identifier for the RDS cluster."
  type        = string
  default     = null
}

variable "domain_iam_role_name" {
  description = "IAM role used for joining the RDS cluster to the domain."
  type        = string
  default     = null
}

variable "enable_global_write_forwarding" {
  description = "Whether global write forwarding is enabled."
  type        = bool
  default     = false
}

variable "enable_http_endpoint" {
  description = "Whether the HTTP endpoint is enabled."
  type        = bool
  default     = false
}

variable "enable_local_write_forwarding" {
  description = "Whether local write forwarding is enabled."
  type        = bool
  default     = false
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types exported to CloudWatch Logs."
  type        = list(string)
  default     = []
}

variable "engine" {
  description = "Database engine used by the RDS cluster."
  type        = string
  default     = "aurora-postgresql"
}

variable "engine_lifecycle_support" {
  description = "Extended support lifecycle configuration for the database engine."
  type        = string
  default     = null
}

variable "engine_mode" {
  description = "Aurora engine mode."
  type        = string
  default     = "provisioned"
}

variable "engine_version" {
  description = "Database engine version."
  type        = string
  default     = null
}

variable "final_snapshot_identifier" {
  description = "Identifier for the final snapshot created when the cluster is deleted."
  type        = string
  default     = null
}

variable "global_cluster_identifier" {
  description = "Identifier of the global cluster to associate with this cluster."
  type        = string
  default     = null
}

variable "iam_database_authentication_enabled" {
  description = "Whether IAM database authentication is enabled."
  type        = bool
  default     = false
}

variable "iam_roles" {
  description = "IAM roles associated with the RDS cluster."
  type        = list(string)
  default     = []
}

variable "iops" {
  description = "Provisioned IOPS for supported RDS cluster configurations."
  type        = number
  default     = null
}

variable "kms_key_id" {
  description = "KMS key ARN or ID used for RDS storage encryption."
  type        = string
  default     = null
}

variable "manage_master_user_password" {
  description = "Whether AWS Secrets Manager manages the master user password."
  type        = bool
  default     = null
}

variable "master_password" {
  description = "Master password for the RDS cluster."
  type        = string
  default     = null
  sensitive   = true
}

variable "master_password_wo" {
  description = "Write-only master password for the RDS cluster."
  type        = string
  default     = null
  sensitive   = true
}

variable "master_password_wo_version" {
  description = "Version number used to trigger updates to the write-only master password."
  type        = number
  default     = null
}

variable "master_username" {
  description = "Master username for the RDS cluster."
  type        = string
  default     = null
  sensitive   = true
}

variable "monitoring_interval" {
  description = "Enhanced Monitoring interval in seconds for the cluster."
  type        = number
  default     = 0
}

variable "network_type" {
  description = "Network type used by the RDS cluster."
  type        = string
  default     = "IPV4"
}

variable "performance_insights_enabled" {
  description = "Whether Performance Insights is enabled."
  type        = bool
  default     = false
}

variable "performance_insights_kms_key_id" {
  description = "KMS key used to encrypt Performance Insights data."
  type        = string
  default     = null
}

variable "performance_insights_retention_period" {
  description = "Performance Insights retention period in days."
  type        = number
  default     = 7

  validation {
    condition     = contains([7, 31, 62, 93, 124, 155, 186, 217, 248, 279, 310, 341, 372, 403, 434, 465, 496, 527, 558, 589, 620, 651, 682, 713, 744, 775, 806, 837, 868, 899, 930, 961, 992, 1023, 1054, 1085, 1116, 1147, 1178, 1209, 1240, 1271, 1302, 1333, 1364, 1395, 1426, 1457, 1488, 1519, 1550, 1581, 1612, 1643, 1674, 1705, 1736, 1767, 1798, 1829, 1860, 1891, 1922, 1953, 1984, 2015, 2046, 2077, 2108, 2139, 2170, 2201, 2232, 2263, 2294, 2325, 2356, 2387, 2418, 2449, 2480, 2511, 2542, 2573, 2604, 2635, 2666, 2697, 2728, 2759, 2790, 2821, 2852, 2883, 2914, 2945, 2976, 3007, 3038, 3069, 3100, 3131, 3162, 3193, 3224, 3255, 3286, 3317, 3348, 3379, 3410, 3441, 3472, 3503, 3534, 3565, 3596, 3627, 3658, 3689, 3720, 3751, 3782, 3813, 3844, 3875, 3906, 3937, 3968, 3999, 4030, 4061, 4092, 4123, 4154, 4185, 4216, 4247, 4278, 4309, 4340, 4371, 4402, 4433, 4464, 4495, 4526, 4557, 4588, 4619, 4650, 4681, 4712, 4743, 4774, 4805, 4836, 4867, 4898, 4929, 4960, 4991, 5022, 5053, 5084, 5115, 5146, 5177, 5208, 5239, 5270, 5301, 5332, 5363, 5394, 5425, 5456, 5487, 5518, 5549, 5580, 5611, 5642, 5673, 5704, 5735, 5766, 5797, 5828, 5859, 5890, 5921, 5952, 5983, 6014, 6045, 6076, 6107, 6138, 6169, 6200, 6231, 6262, 6293, 6324, 6355, 6386, 6417, 6448, 6479, 6510, 6541, 6572, 6603, 6634, 6665, 6696, 6727, 6758, 6789, 6820, 6851, 6882, 6913, 6944, 6975, 7006, 7037, 7068, 7099, 7130, 7161, 7192, 7223, 7254, 7285, 731, 7], var.performance_insights_retention_period)
    error_message = "Invalid Performance Insights retention period."
  }
}

variable "port" {
  description = "Port on which the RDS cluster accepts connections."
  type        = number
  default     = 5432
}

variable "preferred_backup_window" {
  description = "Preferred daily backup window."
  type        = string
  default     = null
}

variable "preferred_maintenance_window" {
  description = "Preferred weekly maintenance window."
  type        = string
  default     = null
}

variable "region" {
  description = "AWS region where the RDS resource is managed."
  type        = string
  default     = null
}

variable "replication_source_identifier" {
  description = "Source RDS cluster identifier when creating a read replica."
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the cluster."
  type        = bool
  default     = true
}

variable "snapshot_identifier" {
  description = "Snapshot identifier used to restore the RDS cluster."
  type        = string
  default     = null
}

variable "source_region" {
  description = "Source AWS region used when restoring or replicating an RDS cluster."
  type        = string
  default     = null
}

variable "storage_encrypted" {
  description = "Whether RDS storage is encrypted."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to the RDS cluster."
  type        = map(string)
  default     = {}
}

variable "vpc_security_group_ids" {
  description = "Security groups associated with the RDS cluster."
  type        = list(string)
  default     = []
}


# ---------------------------------------------------------
# RDS CLUSTER INSTANCE VARIABLES
# ---------------------------------------------------------

variable "instance_auto_minor_version_upgrade" {
  description = "Whether minor engine version upgrades are applied automatically to the RDS instance."
  type        = bool
  default     = true
}

variable "instance_availability_zone" {
  description = "Availability Zone of the RDS cluster instance."
  type        = string
  default     = null
}

variable "instance_ca_cert_identifier" {
  description = "CA certificate identifier used by the RDS instance."
  type        = string
  default     = null
}

variable "instance_copy_tags_to_snapshot" {
  description = "Whether instance tags are copied to snapshots."
  type        = bool
  default     = false
}

variable "custom_iam_instance_profile" {
  description = "Custom IAM instance profile associated with the RDS instance."
  type        = string
  default     = null
}

variable "instance_db_parameter_group_name" {
  description = "DB parameter group associated with the RDS cluster instance."
  type        = string
  default     = null
}

variable "instance_db_subnet_group_name" {
  description = "DB subnet group associated with the RDS cluster instance."
  type        = string
  default     = null
}

variable "instance_engine" {
  description = "Database engine used by the RDS cluster instance."
  type        = string
  default     = "aurora-postgresql"
}

variable "instance_engine_version" {
  description = "Database engine version used by the RDS cluster instance."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Whether the RDS cluster instance can be forcefully destroyed."
  type        = bool
  default     = false
}

variable "instance_identifier" {
  description = "Unique identifier of the RDS cluster instance."
  type        = string
}

variable "instance_class" {
  description = "Compute and memory class of the RDS cluster instance."
  type        = string
  default     = "db.r6g.xlarge"
}

variable "instance_monitoring_interval" {
  description = "Enhanced Monitoring interval in seconds. Zero disables Enhanced Monitoring."
  type        = number
  default     = 0
}

variable "monitoring_role_arn" {
  description = "IAM role ARN used for Enhanced Monitoring."
  type        = string
  default     = null
}

variable "instance_performance_insights_enabled" {
  description = "Whether Performance Insights is enabled for the RDS instance."
  type        = bool
  default     = false
}

variable "instance_performance_insights_kms_key_id" {
  description = "KMS key used to encrypt Performance Insights data for the RDS instance."
  type        = string
  default     = null
}

variable "instance_performance_insights_retention_period" {
  description = "Performance Insights retention period for the RDS instance."
  type        = number
  default     = 7

  validation {
    condition     = contains([7, 731], var.instance_performance_insights_retention_period)
    error_message = "Performance Insights retention period must be 7 or 731 days."
  }
}

variable "instance_preferred_backup_window" {
  description = "Preferred daily backup window for the RDS cluster instance."
  type        = string
  default     = null
}

variable "instance_preferred_maintenance_window" {
  description = "Preferred weekly maintenance window for the RDS cluster instance."
  type        = string
  default     = null
}

variable "promotion_tier" {
  description = "Failover priority tier of the RDS cluster instance."
  type        = number
  default     = 1
}

variable "publicly_accessible" {
  description = "Whether the RDS cluster instance is publicly accessible."
  type        = bool
  default     = false
}

variable "instance_tags" {
  description = "Tags applied to the RDS cluster instance."
  type        = map(string)
  default     = {}
}
