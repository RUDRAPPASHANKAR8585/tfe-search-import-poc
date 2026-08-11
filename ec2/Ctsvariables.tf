# ============================================================
# EC2 BASIC CONFIGURATION
# ============================================================

variable "ami_id" {
  description = "AMI ID used to launch the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the existing EC2 key pair."
  type        = string
}


# ============================================================
# NETWORKING
# ============================================================

variable "subnet_name" {
  description = "Name tag of the existing subnet where the EC2 instance will be deployed."
  type        = string
}

variable "security_group_name" {
  description = "Name of the existing security group associated with the EC2 instance."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IPv4 address with the instance."
  type        = bool
  default     = false
}

variable "private_ip" {
  description = "Primary private IPv4 address assigned to the instance."
  type        = string
  default     = null
}

variable "secondary_private_ips" {
  description = "List of secondary private IPv4 addresses."
  type        = list(string)
  default     = []
}

variable "ipv6_address_count" {
  description = "Number of IPv6 addresses to assign to the instance."
  type        = number
  default     = 0
}

variable "ipv6_addresses" {
  description = "List of specific IPv6 addresses to assign to the instance."
  type        = list(string)
  default     = []
}

variable "source_dest_check" {
  description = "Whether source/destination checking is enabled on the primary network interface."
  type        = bool
  default     = true
}


# ============================================================
# AVAILABILITY / PLACEMENT
# ============================================================

variable "availability_zone" {
  description = "Availability Zone for the EC2 instance. Must match the selected subnet."
  type        = string
  default     = null
}

variable "placement_partition_number" {
  description = "Partition number for instances in a partition placement group."
  type        = number
  default     = null
}

variable "tenancy" {
  description = "Tenancy of the EC2 instance."
  type        = string
  default     = "default"

  validation {
    condition = contains(
      ["default", "dedicated", "host"],
      var.tenancy
    )

    error_message = "Tenancy must be default, dedicated, or host."
  }
}


# ============================================================
# INSTANCE BEHAVIOR
# ============================================================

variable "disable_api_stop" {
  description = "Whether the EC2 Stop API is disabled."
  type        = bool
  default     = false
}

variable "disable_api_termination" {
  description = "Whether termination protection is enabled."
  type        = bool
  default     = false
}

variable "ebs_optimized" {
  description = "Whether the instance is EBS optimized."
  type        = bool
  default     = false
}

variable "force_destroy" {
  description = "Whether Terraform should force destroy the instance."
  type        = bool
  default     = false
}

variable "get_password_data" {
  description = "Whether to retrieve Windows administrator password data."
  type        = bool
  default     = false
}

variable "hibernation" {
  description = "Whether hibernation is enabled for the instance."
  type        = bool
  default     = false
}

variable "instance_initiated_shutdown_behavior" {
  description = "Behavior when the instance initiates shutdown."
  type        = string
  default     = "stop"

  validation {
    condition = contains(
      ["stop", "terminate"],
      var.instance_initiated_shutdown_behavior
    )

    error_message = "Value must be either stop or terminate."
  }
}

variable "monitoring" {
  description = "Whether detailed EC2 monitoring is enabled."
  type        = bool
  default     = false
}


# ============================================================
# USER DATA
# ============================================================

variable "user_data" {
  description = "User data script supplied to the EC2 instance."
  type        = string
  default     = null
}

variable "user_data_replace_on_change" {
  description = "Whether a change to user data should replace the instance."
  type        = bool
  default     = false
}


# ============================================================
# CPU OPTIONS
# ============================================================

variable "cpu_core_count" {
  description = "Number of CPU cores."
  type        = number
  default     = null
}

variable "cpu_threads_per_core" {
  description = "Number of threads per CPU core."
  type        = number
  default     = null
}


# ============================================================
# CPU CREDIT SPECIFICATION
# ============================================================

variable "cpu_credits" {
  description = "CPU credit specification for burstable instances."
  type        = string
  default     = "standard"

  validation {
    condition = contains(
      ["standard", "unlimited"],
      var.cpu_credits
    )

    error_message = "cpu_credits must be standard or unlimited."
  }
}


# ============================================================
# CAPACITY RESERVATION
# ============================================================

variable "capacity_reservation_preference" {
  description = "Capacity reservation preference."
  type        = string
  default     = "open"

  validation {
    condition = contains(
      ["open", "none"],
      var.capacity_reservation_preference
    )

    error_message = "Value must be open or none."
  }
}


# ============================================================
# ROOT EBS VOLUME
# ============================================================

variable "root_delete_on_termination" {
  description = "Whether the root EBS volume is deleted when the instance is terminated."
  type        = bool
  default     = true
}

variable "root_encrypted" {
  description = "Whether the root EBS volume is encrypted."
  type        = bool
  default     = true
}

variable "root_iops" {
  description = "IOPS provisioned for the root EBS volume."
  type        = number
  default     = null
}

variable "root_kms_key_id" {
  description = "KMS key ARN or ID used to encrypt the root EBS volume."
  type        = string
  default     = null
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB."
  type        = number
  default     = 10
}

variable "root_volume_type" {
  description = "Root EBS volume type."
  type        = string
  default     = "gp3"
}

variable "root_throughput" {
  description = "Throughput of the root gp3 EBS volume in MiB/s."
  type        = number
  default     = null
}


# ============================================================
# ADDITIONAL EBS BLOCK DEVICES
# ============================================================

variable "ebs_block_devices" {
  description = "Additional EBS volumes attached to the EC2 instance."

  type = list(object({
    device_name           = string
    delete_on_termination = bool
    encrypted             = bool
    iops                  = optional(number)
    kms_key_id            = optional(string)
    snapshot_id           = optional(string)
    volume_size           = optional(number)
    volume_type           = string
    throughput            = optional(number)
  }))

  default = []
}


# ============================================================
# ENCLAVE OPTIONS
# ============================================================

variable "enclave_enabled" {
  description = "Whether Nitro Enclaves are enabled."
  type        = bool
  default     = false
}


# ============================================================
# MAINTENANCE OPTIONS
# ============================================================

variable "auto_recovery" {
  description = "EC2 automatic recovery behavior."
  type        = string
  default     = "default"

  validation {
    condition = contains(
      ["default", "disabled"],
      var.auto_recovery
    )

    error_message = "auto_recovery must be default or disabled."
  }
}


# ============================================================
# METADATA OPTIONS
# ============================================================

variable "metadata_http_endpoint" {
  description = "Whether the EC2 Instance Metadata Service endpoint is enabled."
  type        = string
  default     = "enabled"

  validation {
    condition = contains(
      ["enabled", "disabled"],
      var.metadata_http_endpoint
    )

    error_message = "metadata_http_endpoint must be enabled or disabled."
  }
}

variable "metadata_http_protocol_ipv6" {
  description = "Whether IPv6 is enabled for the Instance Metadata Service."
  type        = string
  default     = "disabled"

  validation {
    condition = contains(
      ["enabled", "disabled"],
      var.metadata_http_protocol_ipv6
    )

    error_message = "metadata_http_protocol_ipv6 must be enabled or disabled."
  }
}

variable "metadata_http_put_response_hop_limit" {
  description = "HTTP PUT response hop limit for the Instance Metadata Service."
  type        = number
  default     = 1
}

variable "metadata_http_tokens" {
  description = "Whether IMDSv2 tokens are optional or required."
  type        = string
  default     = "required"

  validation {
    condition = contains(
      ["optional", "required"],
      var.metadata_http_tokens
    )

    error_message = "metadata_http_tokens must be optional or required."
  }
}

variable "instance_metadata_tags" {
  description = "Whether instance tags are available through the Instance Metadata Service."
  type        = string
  default     = "disabled"

  validation {
    condition = contains(
      ["enabled", "disabled"],
      var.instance_metadata_tags
    )

    error_message = "instance_metadata_tags must be enabled or disabled."
  }
}


# ============================================================
# PRIVATE DNS NAME OPTIONS
# ============================================================

variable "enable_resource_name_dns_a_record" {
  description = "Whether to create an A record for the resource name."
  type        = bool
  default     = false
}

variable "enable_resource_name_dns_aaaa_record" {
  description = "Whether to create an AAAA record for the resource name."
  type        = bool
  default     = false
}

variable "hostname_type" {
  description = "Hostname type for the EC2 instance."
  type        = string
  default     = "ip-name"

  validation {
    condition = contains(
      ["ip-name", "resource-name"],
      var.hostname_type
    )

    error_message = "hostname_type must be ip-name or resource-name."
  }
}


# ============================================================
# TAGS
# ============================================================

variable "tags" {
  description = "Tags assigned to the EC2 instance."
  type        = map(string)

  default = {}
}

variable "volume_tags" {
  description = "Tags assigned to EBS volumes created by the EC2 instance."
  type        = map(string)

  default = {}
}
