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


module "lambda" {

  source = "./lambda"

  function_name = "TFE_Log_Forwarder"

  description = "Demonstrates logging from AWS Lambda code to Splunk's HTTP event collector"

  runtime = "nodejs18.x"

  handler = "index.handler"

  role = "arn:aws:iam::499998932841:role/RRDRAR27_AWS_APP01_TFE_Lambda"

  filename = "${path.root}/lambda-code/tfe-log-forwarder.zip"

  memory_size = 512

  timeout = 10

  reserved_concurrent_executions = 100

  publish = false

  architectures = ["x86_64"]

  environment_variables = {
    HTTPS_PROXY = "http://proxy-euie.aws.novartis.net:3128"
    HTTP_PROXY  = "http://proxy-euie.aws.novartis.net:3128"
    http_proxy  = "http://proxy-euie.aws.novartis.net:3128"
    https_proxy = "http://proxy-euie.aws.novartis.net:3128"
  }

  ephemeral_storage_size = 512

  log_format = "Text"

  log_group = "/aws/lambda/TFE_Log_Forwarder"

  tracing_mode = "PassThrough"

  subnet_ids = [
    "subnet-0b99ad1ab65ef1e6c",
    "subnet-0d373658a72ef65eb"
  ]

  security_group_ids = [
    "sg-0f0444ffa9aff4e6c"
  ]

  tags = {
    "lambda-console:blueprint" = "splunk-logging"
  }
}
