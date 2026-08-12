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




variable "region_name" {
  description = "Short region identifier used in the organization's AWS resource naming convention."
  type        = string
}

variable "account_name" {
  description = "Short account identifier used in the organization's AWS resource naming convention."
  type        = string
}

variable "environment" {
  description = "Environment name used in the resource naming convention."
  type        = string
}

variable "vpc_suffix" {
  description = "VPC naming suffix used by the organization's naming convention."
  type        = string
  default     = "R27"
}

variable "availability_zone_code" {
  description = "Internal availability zone code used in the subnet name, for example A01, A02, or B01."
  type        = string
}

# ------------------------------------------------------------
# Existing VPC
# ------------------------------------------------------------

data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"

    values = [
      "VPC${var.region_name}R${var.account_name}${var.vpc_suffix}${var.environment}"
    ]
  }
}


# ------------------------------------------------------------
# Existing Subnet
# ------------------------------------------------------------

data "aws_subnet" "selected" {
  filter {
    name = "tag:Name"

    values = [
      "PSR${var.account_name}-${var.region_name}${var.availability_zone_code}"
    ]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}






variable "security_group_type" {
  description = "Security group type/code used in the naming convention, for example LXGL."
  type        = string
  default     = "LXGL"
}

variable "security_group_number" {
  description = "Security group sequence number used in the naming convention."
  type        = string
  default     = "001"
}



# ------------------------------------------------------------
# Existing Security Group
# ------------------------------------------------------------

data "aws_security_group" "selected" {
  filter {
    name = "group-name"

    values = [
      "${var.region_name}${var.security_group_type}${var.security_group_number}"
    ]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}
