module "lambda-function" {

  source = "./lambda"

  function_name = var.lambda_function_name
  description   = var.lambda_description

  runtime = var.lambda_runtime
  handler = var.lambda_handler

  role = var.lambda_role

  memory_size = var.lambda_memory_size
  timeout     = var.lambda_timeout

  reserved_concurrent_executions = var.lambda_reserved_concurrent_executions

  publish = var.lambda_publish

  kms_key_arn = var.lambda_kms_key_arn

  architectures = var.lambda_architectures

  layers = var.lambda_layers

  environment_variables = var.lambda_environment_variables

  ephemeral_storage_size = var.lambda_ephemeral_storage_size

  log_format            = var.lambda_log_format
  application_log_level = var.lambda_application_log_level
  system_log_level      = var.lambda_system_log_level
  log_group              = var.lambda_log_group

  tracing_mode = var.lambda_tracing_mode

  subnet_ids = var.lambda_subnet_ids

  security_group_ids = var.lambda_security_group_ids

  ipv6_allowed_for_dual_stack = var.lambda_ipv6_allowed_for_dual_stack

  tags = var.lambda_tags
}

variable "lambda_function_name" {
  description = "Name of the Lambda function."
  type        = string
  default     = "TFE_Log_Forwarder"
}

variable "lambda_description" {
  description = "Description of the Lambda function."
  type        = string
  default     = "Demonstrates logging from AWS Lambda code to Splunk's HTTP event collector"
}

variable "lambda_runtime" {
  description = "Lambda runtime."
  type        = string
  default     = "nodejs18.x"
}

variable "lambda_handler" {
  description = "Lambda handler."
  type        = string
  default     = "index.handler"
}

variable "lambda_role" {
  description = "IAM role ARN used by the Lambda function."
  type        = string
  default     = "arn:aws:iam::499998932841:role/RRDRAR27_AWS_APP01_TFE_Lambda"
}

variable "lambda_memory_size" {
  description = "Lambda memory allocation in MB."
  type        = number
  default     = 512
}

variable "lambda_timeout" {
  description = "Lambda timeout in seconds."
  type        = number
  default     = 10
}

variable "lambda_reserved_concurrent_executions" {
  description = "Reserved concurrent executions for the Lambda function."
  type        = number
  default     = 100
}

variable "lambda_publish" {
  description = "Whether to publish a new Lambda version."
  type        = bool
  default     = false
}

variable "lambda_kms_key_arn" {
  description = "KMS key ARN used for Lambda environment variable encryption."
  type        = string
  default     = null
}

variable "lambda_architectures" {
  description = "Lambda instruction set architectures."
  type        = list(string)
  default     = ["x86_64"]
}

variable "lambda_layers" {
  description = "Lambda Layer ARNs."
  type        = list(string)
  default     = []
}

variable "lambda_environment_variables" {
  description = "Environment variables configured for the Lambda function."
  type        = map(string)
  default = {
    HTTPS_PROXY = "http://proxy-euie.aws.novartis.net:3128"
    HTTP_PROXY  = "http://proxy-euie.aws.novartis.net:3128"
    http_proxy  = "http://proxy-euie.aws.novartis.net:3128"
    https_proxy = "http://proxy-euie.aws.novartis.net:3128"
  }
}

variable "lambda_ephemeral_storage_size" {
  description = "Lambda ephemeral storage size in MB."
  type        = number
  default     = 512
}

variable "lambda_log_format" {
  description = "Lambda logging format."
  type        = string
  default     = "Text"
}

variable "lambda_application_log_level" {
  description = "Application log level."
  type        = string
  default     = null
}

variable "lambda_system_log_level" {
  description = "System log level."
  type        = string
  default     = null
}

variable "lambda_log_group" {
  description = "CloudWatch log group for the Lambda function."
  type        = string
  default     = "/aws/lambda/TFE_Log_Forwarder"
}

variable "lambda_tracing_mode" {
  description = "AWS X-Ray tracing mode."
  type        = string
  default     = "PassThrough"
}

variable "lambda_subnet_ids" {
  description = "Subnet IDs used by the Lambda function."
  type        = list(string)
  default = [
    "subnet-0b99ad1ab65ef1e6c",
    "subnet-0d373658a72ef65eb"
  ]
}

variable "lambda_security_group_ids" {
  description = "Security group IDs used by the Lambda function."
  type        = list(string)
  default = [
    "sg-0f0444ffa9aff4e6c"
  ]
}

variable "lambda_ipv6_allowed_for_dual_stack" {
  description = "Whether IPv6 dual-stack is enabled for the Lambda VPC."
  type        = bool
  default     = false
}

variable "lambda_tags" {
  description = "Tags assigned to the Lambda function."
  type        = map(string)
  default = {
    "lambda-console:blueprint" = "splunk-logging"
  }
}
