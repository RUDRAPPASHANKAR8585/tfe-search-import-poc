# ============================================================
# EC2 INSTANCE
# ============================================================

output "instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.unmanaged.id
}

output "instance_arn" {
  description = "ARN of the EC2 instance."
  value       = aws_instance.unmanaged.arn
}

output "instance_name" {
  description = "Name tag of the EC2 instance."
  value       = aws_instance.unmanaged.tags["Name"]
}


# ============================================================
# NETWORKING
# ============================================================

output "vpc_id" {
  description = "ID of the existing VPC used by the EC2 instance."
  value       = data.aws_vpc.selected.id
}

output "subnet_id" {
  description = "ID of the existing subnet used by the EC2 instance."
  value       = data.aws_subnet.selected.id
}

output "availability_zone" {
  description = "Availability Zone of the EC2 instance."
  value       = aws_instance.unmanaged.availability_zone
}

output "security_group_id" {
  description = "ID of the existing security group associated with the instance."
  value       = data.aws_security_group.selected.id
}


# ============================================================
# IP INFORMATION
# ============================================================

output "private_ip" {
  description = "Private IPv4 address of the EC2 instance."
  value       = aws_instance.unmanaged.private_ip
}

output "public_ip" {
  description = "Public IPv4 address of the EC2 instance, if assigned."
  value       = aws_instance.unmanaged.public_ip
}

output "private_dns" {
  description = "Private DNS name of the EC2 instance."
  value       = aws_instance.unmanaged.private_dns
}


# ============================================================
# EBS
# ============================================================

output "root_volume_id" {
  description = "ID of the root EBS volume."
  value       = aws_instance.unmanaged.root_block_device[0].volume_id
}

output "root_volume_size" {
  description = "Size of the root EBS volume in GiB."
  value       = aws_instance.unmanaged.root_block_device[0].volume_size
}


# ============================================================
# INSTANCE CONFIGURATION
# ============================================================

output "instance_type" {
  description = "EC2 instance type."
  value       = aws_instance.unmanaged.instance_type
}

output "ami_id" {
  description = "AMI ID used by the EC2 instance."
  value       = aws_instance.unmanaged.ami
}

output "key_name" {
  description = "EC2 key pair associated with the instance."
  value       = aws_instance.unmanaged.key_name
}
