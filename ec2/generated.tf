# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "unmanaged" {
  ami                                  = "ami-035827357e3c7e810"
  associate_public_ip_address          = false
  availability_zone                    = "ap-south-1a"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  force_destroy                        = false
  get_password_data                    = false
  hibernation                          = false
  iam_instance_profile                 = "tfe_ssm_full_access"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  #ipv6_address_count                   = 0
  ipv6_addresses             = []
  monitoring                 = false
  placement_partition_number = 0
  private_ip                 = "10.0.132.250"
  region                     = "ap-south-1"
  secondary_private_ips      = []
  security_groups            = []
  source_dest_check          = true
  subnet_id                  = "subnet-021704194f276a105"
  tags = {
    Environment = "Dev"
    Name        = "tfe-poc-search-import"
    Purpose     = "POC"
  }
  tags_all = {
    Environment = "Dev"
    Name        = "tfe-poc-search-import"
    Purpose     = "POC"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-08764e79f315a4bf8"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  ebs_block_device {
    delete_on_termination = false
    device_name           = "/dev/sdb"
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  # primary_network_interface {
  #   network_interface_id = "eni-04c28f14a9934e911"
  # }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}
