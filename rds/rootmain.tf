module "rds" {
  source = "./rds"

  allocated_storage = var.rds_allocated_storage

  allow_major_version_upgrade = var.rds_allow_major_version_upgrade

  availability_zones = var.rds_availability_zones

  backtrack_window = var.rds_backtrack_window

  backup_retention_period = var.rds_backup_retention_period

  cluster_identifier = var.rds_cluster_identifier

  copy_tags_to_snapshot = var.rds_copy_tags_to_snapshot

  database_insights_mode = var.rds_database_insights_mode

  database_name = var.rds_database_name

  db_cluster_instance_class = var.rds_db_cluster_instance_class

  db_cluster_parameter_group_name = var.rds_db_cluster_parameter_group_name

  db_instance_parameter_group_name = var.rds_db_instance_parameter_group_name

  db_subnet_group_name = var.rds_db_subnet_group_name

  delete_automated_backups = var.rds_delete_automated_backups

  deletion_protection = var.rds_deletion_protection

  domain = var.rds_domain

  domain_iam_role_name = var.rds_domain_iam_role_name

  enable_global_write_forwarding = var.rds_enable_global_write_forwarding

  enable_http_endpoint = var.rds_enable_http_endpoint

  enable_local_write_forwarding = var.rds_enable_local_write_forwarding

  enabled_cloudwatch_logs_exports = var.rds_enabled_cloudwatch_logs_exports

  engine = var.rds_engine

  engine_lifecycle_support = var.rds_engine_lifecycle_support

  engine_mode = var.rds_engine_mode

  engine_version = var.rds_engine_version

  final_snapshot_identifier = var.rds_final_snapshot_identifier

  global_cluster_identifier = var.rds_global_cluster_identifier

  iam_database_authentication_enabled = var.rds_iam_database_authentication_enabled

  iam_roles = var.rds_iam_roles

  iops = var.rds_iops

  kms_key_id = var.rds_kms_key_id

  manage_master_user_password = var.rds_manage_master_user_password

  master_password = var.rds_master_password

  master_password_wo = var.rds_master_password_wo

  master_password_wo_version = var.rds_master_password_wo_version

  master_username = var.rds_master_username

  monitoring_interval = var.rds_monitoring_interval

  network_type = var.rds_network_type

  performance_insights_enabled = var.rds_performance_insights_enabled

  performance_insights_kms_key_id = var.rds_performance_insights_kms_key_id

  performance_insights_retention_period = var.rds_performance_insights_retention_period

  port = var.rds_port

  preferred_backup_window = var.rds_preferred_backup_window

  preferred_maintenance_window = var.rds_preferred_maintenance_window

  region = var.rds_region

  replication_source_identifier = var.rds_replication_source_identifier

  skip_final_snapshot = var.rds_skip_final_snapshot

  snapshot_identifier = var.rds_snapshot_identifier

  source_region = var.rds_source_region

  storage_encrypted = var.rds_storage_encrypted

  tags = var.rds_tags

  vpc_security_group_ids = var.rds_vpc_security_group_ids


  # RDS cluster instance

  instance_auto_minor_version_upgrade = var.rds_instance_auto_minor_version_upgrade

  instance_availability_zone = var.rds_instance_availability_zone

  instance_ca_cert_identifier = var.rds_instance_ca_cert_identifier

  instance_copy_tags_to_snapshot = var.rds_instance_copy_tags_to_snapshot

  custom_iam_instance_profile = var.rds_custom_iam_instance_profile

  instance_db_parameter_group_name = var.rds_instance_db_parameter_group_name

  instance_db_subnet_group_name = var.rds_instance_db_subnet_group_name

  instance_engine = var.rds_instance_engine

  instance_engine_version = var.rds_instance_engine_version

  force_destroy = var.rds_force_destroy

  instance_identifier = var.rds_instance_identifier

  instance_class = var.rds_instance_class

  instance_monitoring_interval = var.rds_instance_monitoring_interval

  monitoring_role_arn = var.rds_monitoring_role_arn

  instance_performance_insights_enabled = var.rds_instance_performance_insights_enabled

  instance_performance_insights_kms_key_id = var.rds_instance_performance_insights_kms_key_id

  instance_performance_insights_retention_period = var.rds_instance_performance_insights_retention_period

  instance_preferred_backup_window = var.rds_instance_preferred_backup_window

  instance_preferred_maintenance_window = var.rds_instance_preferred_maintenance_window

  promotion_tier = var.rds_promotion_tier

  publicly_accessible = var.rds_publicly_accessible

  instance_tags = var.rds_instance_tags
}
