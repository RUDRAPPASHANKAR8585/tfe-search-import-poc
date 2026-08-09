resource "aws_lambda_function" "unmanaged" {
  architectures = ["x86_64"]

  code_sha256 = "R6fL2f5y9xHPTo4NojRtY2hz04DlAxWgwXm4xSMnwRQ="

  code_signing_config_arn = null
  description             = null
  filename                = "s3-poc.zip"
  function_name           = "s3-poc"
  handler                 = "lambda_function.lambda_handler"

  kms_key_arn  = null
  layers       = []
  memory_size  = 128
  package_type = "Zip"

  region = "ap-south-1"

  reserved_concurrent_executions = -1

  role    = "arn:aws:iam::700030738273:role/service-role/s3-poc-role-8bsst1dg"
  runtime = "python3.14"

  skip_destroy = false

  tags     = {}
  tags_all = {}

  timeout = 3

  ephemeral_storage {
    size = 512
  }

  logging_config {
    application_log_level = null
    log_format            = "Text"
    log_group             = "/aws/lambda/s3-poc"
    system_log_level      = null
  }

  tracing_config {
    mode = "PassThrough"
  }

  lifecycle {
    ignore_changes = [
      filename,
      publish
    ]
  }
}