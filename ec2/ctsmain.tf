resource "aws_instance" "unmanaged" {

  # ---------------------------------------------------------
  # Basic EC2 Configuration
  # ---------------------------------------------------------

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  # ---------------------------------------------------------
  # Networking
  # ---------------------------------------------------------

  subnet_id                   = data.aws_subnet.selected.id
  vpc_security_group_ids     = [data.aws_security_group.selected.id]
  associate_public_ip_address = var.associate_public_ip_address
  private_ip                  = var.private_ip
  source_dest_check           = var.source_dest_check

  secondary_private_ips = var.secondary_private_ips
  ipv6_address_count   = var.ipv6_address_count
  ipv6_addresses       = var.ipv6_addresses

  # ---------------------------------------------------------
  # Instance Behavior
  # ---------------------------------------------------------

  availability_zone = var.availability_zone

  disable_api_stop        = var.disable_api_stop
  disable_api_termination = var.disable_api_termination
  ebs_optimized           = var.ebs_optimized
  force_destroy           = var.force_destroy
  get_password_data       = var.get_password_data
  hibernation              = var.hibernation

  instance_initiated_shutdown_behavior = (
    var.instance_initiated_shutdown_behavior
  )

  monitoring = var.monitoring

  tenancy = var.tenancy

  placement_partition_number = var.placement_partition_number

  # ---------------------------------------------------------
  # User Data
  # ---------------------------------------------------------

  user_data                 = var.user_data
  user_data_replace_on_change = var.user_data_replace_on_change

  # ---------------------------------------------------------
  # CPU Configuration
  # ---------------------------------------------------------

  cpu_options {
    core_count       = var.cpu_core_count
    threads_per_core = var.cpu_threads_per_core
  }

  # ---------------------------------------------------------
  # CPU Credit Configuration
  # ---------------------------------------------------------

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  # ---------------------------------------------------------
  # Capacity Reservation
  # ---------------------------------------------------------

  capacity_reservation_specification {
    capacity_reservation_preference = (
      var.capacity_reservation_preference
    )
  }

  # ---------------------------------------------------------
  # Root EBS Volume
  # ---------------------------------------------------------

  root_block_device {
    delete_on_termination = var.root_delete_on_termination
    encrypted             = var.root_encrypted
    iops                  = var.root_iops
    kms_key_id            = var.root_kms_key_id
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    throughput            = var.root_throughput
  }

  # ---------------------------------------------------------
  # Additional EBS Block Device
  # ---------------------------------------------------------

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_devices

    content {
      device_name           = ebs_block_device.value.device_name
      delete_on_termination = ebs_block_device.value.delete_on_termination
      encrypted              = ebs_block_device.value.encrypted
      iops                    = ebs_block_device.value.iops
      kms_key_id              = ebs_block_device.value.kms_key_id
      snapshot_id             = ebs_block_device.value.snapshot_id
      volume_size             = ebs_block_device.value.volume_size
      volume_type             = ebs_block_device.value.volume_type
      throughput              = ebs_block_device.value.throughput
    }
  }

  # ---------------------------------------------------------
  # Enclave
  # ---------------------------------------------------------

  enclave_options {
    enabled = var.enclave_enabled
  }

  # ---------------------------------------------------------
  # Instance Maintenance
  # ---------------------------------------------------------

  maintenance_options {
    auto_recovery = var.auto_recovery
  }

  # ---------------------------------------------------------
  # Metadata Options
  # ---------------------------------------------------------

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_protocol_ipv6          = var.metadata_http_protocol_ipv6
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    http_tokens                 = var.metadata_http_tokens
    instance_metadata_tags      = var.instance_metadata_tags
  }

  # ---------------------------------------------------------
  # Private DNS Name Options
  # ---------------------------------------------------------

  private_dns_name_options {
    enable_resource_name_dns_a_record    = var.enable_resource_name_dns_a_record
    enable_resource_name_dns_aaaa_record = var.enable_resource_name_dns_aaaa_record
    hostname_type                        = var.hostname_type
  }

  # ---------------------------------------------------------
  # Tags
  # ---------------------------------------------------------

  tags = var.tags

  volume_tags = var.volume_tags
  }
