# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "database-1"
resource "aws_rds_cluster" "unmanaged" {
  allocated_storage                     = 1
  allow_major_version_upgrade           = null
  auto_minor_version_upgrade            = true
  availability_zones                    = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  backtrack_window                      = 0
  backup_retention_period               = 7
  cluster_identifier                    = "database-1"
  cluster_members                       = ["database-1-instance-1"]
  copy_tags_to_snapshot                 = true
  database_insights_mode                = "advanced"
  db_cluster_instance_class             = null
  db_cluster_parameter_group_name       = "default.aurora-postgresql17"
  db_instance_parameter_group_name      = null
  db_subnet_group_name                  = "default-vpc-009c4a7c504eef9ee"
  delete_automated_backups              = true
  deletion_protection                   = false
  domain                                = null
  domain_iam_role_name                  = null
  enable_global_write_forwarding        = null
  enable_http_endpoint                  = false
  enable_local_write_forwarding         = null
  enabled_cloudwatch_logs_exports       = []
  engine                                = "aurora-postgresql"
  engine_lifecycle_support              = "open-source-rds-extended-support-disabled"
  engine_mode                           = "provisioned"
  engine_version                        = "17.7"
  final_snapshot_identifier             = null
  global_cluster_identifier             = null
  iam_database_authentication_enabled   = false
  iam_roles                             = []
  iops                                  = 0
  kms_key_id                            = "arn:aws:kms:ap-south-1:700030738273:key/5273fc9e-030c-4c49-ab4f-00ed0a641840"
  #manage_master_user_password           = true
  master_password                       = null # sensitive
  master_password_wo                    = null # sensitive
  master_password_wo_version            = null
  master_username                       = "postgres"
  monitoring_interval                   = 60
  monitoring_role_arn                   = "arn:aws:iam::700030738273:role/rds-monitoring-role"
  network_type                          = "IPV4"
  performance_insights_enabled          = true
  performance_insights_kms_key_id       = "arn:aws:kms:ap-south-1:700030738273:key/5273fc9e-030c-4c49-ab4f-00ed0a641840"
  performance_insights_retention_period = 465
  port                                  = 5432
  preferred_backup_window               = "19:12-19:42"
  preferred_maintenance_window          = "tue:06:33-tue:07:03"
  region                                = "ap-south-1"
  replication_source_identifier         = null
  skip_final_snapshot                   = true
  snapshot_identifier                   = null
  source_region                         = null
  storage_encrypted                     = true
  storage_type                          = "aurora-iopt1"
  tags = {
    Env     = "POC"
    Purpose = "TFE POC"
  }
  tags_all = {
    Env     = "POC"
    Purpose = "TFE POC"
  }
  vpc_security_group_ids = ["sg-08764e79f315a4bf8"]
}

# __generated__ by Terraform from "database-1-instance-1"
resource "aws_rds_cluster_instance" "writer" {
  auto_minor_version_upgrade            = true
  availability_zone                     = "ap-south-1a"
  ca_cert_identifier                    = "rds-ca-rsa2048-g1"
  cluster_identifier                    = "database-1"
  copy_tags_to_snapshot                 = false
  custom_iam_instance_profile           = null
  db_parameter_group_name               = "default.aurora-postgresql17"
  db_subnet_group_name                  = "default-vpc-009c4a7c504eef9ee"
  engine                                = "aurora-postgresql"
  engine_version                        = "17.7"
  force_destroy                         = null
  identifier                            = "database-1-instance-1"
  instance_class                        = "db.r7g.large"
  monitoring_interval                   = 60
  monitoring_role_arn                   = "arn:aws:iam::700030738273:role/rds-monitoring-role"
  performance_insights_enabled          = true
  performance_insights_kms_key_id       = "arn:aws:kms:ap-south-1:700030738273:key/5273fc9e-030c-4c49-ab4f-00ed0a641840"
  performance_insights_retention_period = 465
  preferred_backup_window               = "19:12-19:42"
  preferred_maintenance_window          = "tue:06:33-tue:07:03"
  promotion_tier                        = 0
  publicly_accessible                   = false
  region                                = "ap-south-1"
  tags = {
    Env                 = "POC"
    Purpose             = "TFE POC"
    devops-guru-default = "database-1"
  }
  tags_all = {
    Env                 = "POC"
    Purpose             = "TFE POC"
    devops-guru-default = "database-1"
  }
}
