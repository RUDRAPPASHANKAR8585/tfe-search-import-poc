# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "shankar-poc-11"
resource "aws_s3_bucket" "unmamaged" {
  bucket              = "shankar-poc-11"
  bucket_namespace    = "global"
  force_destroy       = false
  object_lock_enabled = true
  region              = "ap-south-2"
  tags = {
    Env     = "POC"
    Name    = "shankar-poc-11"
    Purpose = "Using for TFE Search import POC"
  }
  tags_all = {
    Env     = "POC"
    Name    = "shankar-poc-11"
    Purpose = "Using for TFE Search import POC"
  }
}
