list "aws_rds_cluster" "unmanaged" {
  provider = aws

  config {
    region = "ap-south-1"
  }
}

# list "aws_rds_cluster_instance" "unmanaged" {
#   provider = aws

#   config {
#     region = "ap-south-1"
#   }
# }