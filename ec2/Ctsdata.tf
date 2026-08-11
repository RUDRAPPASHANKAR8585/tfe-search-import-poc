# ============================================================
# EXISTING SUBNET
# ============================================================

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}


# ============================================================
# EXISTING VPC
# ============================================================

data "aws_vpc" "selected" {
  id = data.aws_subnet.selected.vpc_id
}


# ============================================================
# EXISTING SECURITY GROUP
# ============================================================

data "aws_security_group" "selected" {
  filter {
    name   = "group-name"
    values = [var.security_group_name]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}
