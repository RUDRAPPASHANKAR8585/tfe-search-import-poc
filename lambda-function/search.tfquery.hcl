# list "aws_db_instance" "unmanaged" {
#   provider = aws
 
#   config {
#     region = "ap-south-1"
 
#     filter {
#       name   = "db-instance-state"
#       values = ["available"]
#     }
#   }
# }

list "aws_lambda_function" "unmanaged" {
  provider = aws

  config {
    region = "ap-south-1"
  }
}