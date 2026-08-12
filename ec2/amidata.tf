variable "ami_organization" {
  description = "Organization prefix used in the AMI naming convention."
  type        = string
  default     = "NVS"
}

variable "ami_cloud_type" {
  description = "Cloud/platform identifier used in the AMI naming convention."
  type        = string
  default     = "AMZN"
}

variable "ami_os_type" {
  description = "Operating system identifier used in the AMI naming convention."
  type        = string
  default     = "LNX"
}

variable "ami_version" {
  description = "AMI operating system/image version."
  type        = string
  default     = "2.1.1"
}

variable "ami_encryption" {
  description = "Encryption identifier used in the AMI naming convention."
  type        = string
  default     = "ENC"
}

variable "ami_resource_type" {
  description = "Resource/workload identifier used in the AMI naming convention."
  type        = string
  default     = "EC2"
}

variable "ami_architecture" {
  description = "CPU architecture identifier used in the AMI naming convention."
  type        = string
  default     = "X86"
}


# ------------------------------------------------------------
# Existing AMI
# ------------------------------------------------------------

data "aws_ami" "selected" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "${var.ami_organization}-${var.ami_cloud_type}${var.ami_os_type}${var.ami_version}-${var.ami_encryption}-${var.ami_resource_type}-${var.ami_architecture}"
    ]
  }

  owners = ["self"]
}
