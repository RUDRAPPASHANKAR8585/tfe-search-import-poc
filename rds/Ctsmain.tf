resource "aws_rds_cluster" "unmanaged" {
  allocated_storage = var.allocated_storage

  allow_major_version_upgrade = var.allow_major_version_upgrade

  availability_zones = var.availability_zones

  backtrack_window = var.backtrack_window

  backup_retention_period = var.backup_retention_period

  cluster_identifier = var.cluster_identifier

  copy_tags_to_snapshot = var.copy_tags_to_snapshot

  database_insights_mode = var.database_insights_mode

  database_name = var.database_name

  db_cluster_instance_class = var.db_cluster_instance_class

  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name

  db_instance_parameter_group_name = var.db_instance_parameter_group_name

  db_subnet_group_name = var.db_subnet_group_name

  delete_automated_backups = var.delete_automated_backups

  deletion_protection = var.deletion_protection

  domain = var.domain

  domain_iam_role_name = var.domain_iam_role_name

  enable_global_write_forwarding = var.enable_global_write_forwarding

  enable_http_endpoint = var.enable_http_endpoint

  enable_local_write_forwarding = var.enable_local_write_forwarding

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  engine = var.engine

  engine_lifecycle_support = var.engine_lifecycle_support

  engine_mode = var.engine_mode

  engine_version = var.engine_version

  final_snapshot_identifier = var.final_snapshot_identifier

  global_cluster_identifier = var.global_cluster_identifier

  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  iam_roles = var.iam_roles

  iops = var.iops

  kms_key_id = var.kms_key_id

  manage_master_user_password = var.manage_master_user_password

  master_password = var.master_password

  master_password_wo = var.master_password_wo

  master_password_wo_version = var.master_password_wo_version

  master_username = var.master_username

  monitoring_interval = var.monitoring_interval

  network_type = var.network_type

  performance_insights_enabled = var.performance_insights_enabled

  performance_insights_kms_key_id = var.performance_insights_kms_key_id

  performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null

  port = var.port

  preferred_backup_window = var.preferred_backup_window

  preferred_maintenance_window = var.preferred_maintenance_window

  region = var.region

  replication_source_identifier = var.replication_source_identifier

  skip_final_snapshot = var.skip_final_snapshot

  snapshot_identifier = var.snapshot_identifier

  source_region = var.source_region

  storage_encrypted = var.storage_encrypted

  tags = var.tags

  vpc_security_group_ids = var.vpc_security_group_ids
}


resource "aws_rds_cluster_instance" "writer" {
  auto_minor_version_upgrade = var.instance_auto_minor_version_upgrade

  availability_zone = var.instance_availability_zone

  ca_cert_identifier = var.instance_ca_cert_identifier

  cluster_identifier = aws_rds_cluster.unmanaged.id

  copy_tags_to_snapshot = var.instance_copy_tags_to_snapshot

  custom_iam_instance_profile = var.custom_iam_instance_profile

  db_parameter_group_name = var.instance_db_parameter_group_name

  db_subnet_group_name = var.instance_db_subnet_group_name

  engine = var.instance_engine

  engine_version = var.instance_engine_version

  force_destroy = var.force_destroy

  identifier = var.instance_identifier

  instance_class = var.instance_class

  monitoring_interval = var.instance_monitoring_interval

  monitoring_role_arn = var.monitoring_role_arn

  performance_insights_enabled = var.instance_performance_insights_enabled

  performance_insights_kms_key_id = var.instance_performance_insights_kms_key_id

  performance_insights_retention_period = var.instance_performance_insights_enabled ? var.instance_performance_insights_retention_period : null

  preferred_backup_window = var.instance_preferred_backup_window

  preferred_maintenance_window = var.instance_preferred_maintenance_window

  promotion_tier = var.promotion_tier

  publicly_accessible = var.publicly_accessible

  region = var.region

  tags = var.instance_tags
}
