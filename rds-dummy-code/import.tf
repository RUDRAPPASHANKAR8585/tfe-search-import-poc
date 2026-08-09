import {
  to = aws_rds_cluster.tfe_aurora
  id = "tfefdo-aurorapgsql-dr-testing"
}

import {
  to = aws_rds_cluster_instance.tfe_aurora_instance
  id = "tfefdo-aurorapgsql-dr-testing-0"
}