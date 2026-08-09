resource "aws_rds_cluster" "tfe_aurora" {
  cluster_identifier = "tfefdo-aurorapgsql-dr-testing"

  engine         = "aurora-postgresql"
  engine_version = "14.20"

  database_name   = "tfe"
  port            = 5432
  master_username = "tfe_aws_postgres"

  backup_retention_period = 35

  storage_encrypted = true

  deletion_protection = false

  copy_tags_to_snapshot = true

  tags = {
    BillingContact = "GUPTAA2E"
    ClarityID      = "054239"
    Environment    = "DEV"
    region         = "eu-west-1"
  }
}


resource "aws_rds_cluster_instance" "tfe_aurora_instance" {
  identifier = "tfefdo-aurorapgsql-dr-testing-0"

  cluster_identifier = aws_rds_cluster.tfe_aurora.id

  instance_class = "db.r6g.xlarge"

  engine         = "aurora-postgresql"
  engine_version = "14.20"

  availability_zone = "eu-west-1a"

  publicly_accessible = false
}