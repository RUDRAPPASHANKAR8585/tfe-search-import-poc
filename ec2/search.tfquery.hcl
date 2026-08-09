list "aws_instance" "unmanaged" {
  provider = aws
 
  config {
    region = "ap-south-1"
 
    filter {
      name   = "instance-state-name"
      values = ["running"]
    }
  }
}