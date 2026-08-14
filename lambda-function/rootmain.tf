resource "aws_lambda_function" "this" {

  function_name = var.function_name
  description   = var.description

  role = var.role

  runtime     = var.runtime
  handler     = var.handler
  package_type = "Zip"

  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)

  memory_size = var.memory_size
  timeout     = var.timeout

  reserved_concurrent_executions = var.reserved_concurrent_executions

  publish = var.publish

  kms_key_arn = var.kms_key_arn

  architectures = var.architectures

  layers = var.layers

  dynamic "environment" {
    for_each = length(var.environment_variables) > 0 ? [1] : []

    content {
      variables = var.environment_variables
    }
  }

  ephemeral_storage {
    size = var.ephemeral_storage_size
  }

  logging_config {
    log_format            = var.log_format
    application_log_level = var.application_log_level
    system_log_level      = var.system_log_level
    log_group             = var.log_group
  }

  tracing_config {
    mode = var.tracing_mode
  }

  dynamic "vpc_config" {
    for_each = length(var.subnet_ids) > 0 || length(var.security_group_ids) > 0 ? [1] : []

    content {
      subnet_ids                  = var.subnet_ids
      security_group_ids          = var.security_group_ids
      ipv6_allowed_for_dual_stack = var.ipv6_allowed_for_dual_stack
    }
  }

  tags = var.tags
}
