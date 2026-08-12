resource "aws_rds_cluster" "this" {
  cluster_identifier = var.cluster_identifier

  engine         = var.engine
  engine_version = var.engine_version
  engine_mode    = var.engine_mode

  database_name = var.database_name

  availability_zones = var.availability_zones

  db_subnet_group_name            = var.db_subnet_group_name
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name

  backup_retention_period = var.backup_retention_period

  backtrack_window = var.backtrack_window

  copy_tags_to_snapshot = var.copy_tags_to_snapshot
  delete_automated_backups = var.delete_automated_backups
  deletion_protection      = var.deletion_protection

  enable_global_write_forwarding = var.enable_global_write_forwarding
  enable_http_endpoint            = var.enable_http_endpoint
  enable_local_write_forwarding  = var.enable_local_write_forwarding

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  kms_key_id = var.kms_key_id

  master_username = var.master_username

  port = var.port

  preferred_backup_window     = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window

  skip_final_snapshot = var.skip_final_snapshot

  storage_encrypted = var.storage_encrypted

  vpc_security_group_ids = var.vpc_security_group_ids

  tags = var.tags
}


resource "aws_rds_cluster_instance" "writer" {
  identifier         = var.instance_identifier
  cluster_identifier = aws_rds_cluster.this.id

  instance_class = var.instance_class

  engine         = var.engine
  engine_version = var.engine_version

  availability_zone = var.instance_availability_zone

  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  ca_cert_identifier = var.ca_cert_identifier

  copy_tags_to_snapshot = var.instance_copy_tags_to_snapshot

  db_parameter_group_name = var.db_parameter_group_name
  db_subnet_group_name    = var.db_subnet_group_name

  force_destroy = var.force_destroy

  monitoring_interval = var.monitoring_interval

  performance_insights_enabled = var.performance_insights_enabled

  performance_insights_kms_key_id = var.performance_insights_kms_key_id

  # The AWS provider does not accept 0 here.
  # When Performance Insights is disabled, leave this unset.
  performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null

  preferred_backup_window     = var.instance_preferred_backup_window
  preferred_maintenance_window = var.instance_preferred_maintenance_window

  promotion_tier = var.promotion_tier

  publicly_accessible = var.publicly_accessible

  tags = var.tags
}
