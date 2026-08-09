import {
  to = aws_rds_cluster.unmanaged
  id = "database-1"
}

import {
  to = aws_rds_cluster_instance.writer
  id = "database-1-instance-1"
}