module "rds" {
  source = "./rds"

  cluster_identifier = var.rds_cluster_identifier

  engine         = var.rds_engine
  engine_version = var.rds_engine_version
  engine_mode    = var.rds_engine_mode

  database_name = var.rds_database_name

  availability_zones = var.rds_availability_zones

  db_subnet_group_name =
    var.rds_db_subnet_group_name

  db_cluster_parameter_group_name =
    var.rds_db_cluster_parameter_group_name

  db_parameter_group_name =
    var.rds_db_parameter_group_name

  backup_retention_period =
    var.rds_backup_retention_period

  backtrack_window =
    var.rds_backtrack_window

  copy_tags_to_snapshot =
    var.rds_copy_tags_to_snapshot

  delete_automated_backups =
    var.rds_delete_automated_backups

  deletion_protection =
    var.rds_deletion_protection

  enable_global_write_forwarding =
    var.rds_enable_global_write_forwarding

  enable_http_endpoint =
    var.rds_enable_http_endpoint

  enable_local_write_forwarding =
    var.rds_enable_local_write_forwarding

  enabled_cloudwatch_logs_exports =
    var.rds_enabled_cloudwatch_logs_exports

  iam_database_authentication_enabled =
    var.rds_iam_database_authentication_enabled

  kms_key_id =
    var.rds_kms_key_id

  master_username =
    var.rds_master_username

  port =
    var.rds_port

  preferred_backup_window =
    var.rds_preferred_backup_window

  preferred_maintenance_window =
    var.rds_preferred_maintenance_window

  skip_final_snapshot =
    var.rds_skip_final_snapshot

  storage_encrypted =
    var.rds_storage_encrypted

  vpc_security_group_ids =
    var.rds_vpc_security_group_ids

  instance_identifier =
    var.rds_instance_identifier

  instance_class =
    var.rds_instance_class

  instance_availability_zone =
    var.rds_instance_availability_zone

  auto_minor_version_upgrade =
    var.rds_auto_minor_version_upgrade

  ca_cert_identifier =
    var.rds_ca_cert_identifier

  instance_copy_tags_to_snapshot =
    var.rds_instance_copy_tags_to_snapshot

  force_destroy =
    var.rds_force_destroy

  monitoring_interval =
    var.rds_monitoring_interval

  performance_insights_enabled =
    var.rds_performance_insights_enabled

  performance_insights_kms_key_id =
    var.rds_performance_insights_kms_key_id

  performance_insights_retention_period =
    var.rds_performance_insights_retention_period

  instance_preferred_backup_window =
    var.rds_instance_preferred_backup_window

  instance_preferred_maintenance_window =
    var.rds_instance_preferred_maintenance_window

  promotion_tier =
    var.rds_promotion_tier

  publicly_accessible =
    var.rds_publicly_accessible

  tags = var.rds_tags
}
