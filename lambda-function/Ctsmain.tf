variable "function_name" {
  description = "Name of the AWS Lambda function."
  type        = string
}

variable "description" {
  description = "Description of the Lambda function."
  type        = string
  default     = null
}

variable "runtime" {
  description = "Runtime used by the Lambda function."
  type        = string
  default     = "nodejs18.x"
}

variable "handler" {
  description = "Lambda function handler entry point."
  type        = string
  default     = "index.handler"
}

variable "role" {
  description = "ARN of the IAM role assumed by the Lambda function."
  type        = string
}

variable "filename" {
  description = "Local path to the Lambda deployment ZIP package."
  type        = string
}

variable "memory_size" {
  description = "Amount of memory allocated to the Lambda function in MB."
  type        = number
  default     = 512
}

variable "timeout" {
  description = "Maximum execution time of the Lambda function in seconds."
  type        = number
  default     = 10
}

variable "reserved_concurrent_executions" {
  description = "Number of reserved concurrent executions for the Lambda function."
  type        = number
  default     = null
}

variable "publish" {
  description = "Whether to publish a new Lambda version when the function is updated."
  type        = bool
  default     = false
}

variable "kms_key_arn" {
  description = "ARN of the KMS key used to encrypt Lambda environment variables."
  type        = string
  default     = null
}

variable "layers" {
  description = "List of Lambda Layer version ARNs."
  type        = list(string)
  default     = []
}

variable "environment_variables" {
  description = "Environment variables passed to the Lambda function."
  type        = map(string)
  default     = {}
}

variable "architectures" {
  description = "Instruction set architecture used by the Lambda function."
  type        = list(string)
  default     = ["x86_64"]
}

variable "ephemeral_storage_size" {
  description = "Ephemeral storage size in MB available in the Lambda /tmp directory."
  type        = number
  default     = 512
}

variable "log_format" {
  description = "Lambda logging format."
  type        = string
  default     = "Text"
}

variable "application_log_level" {
  description = "Application log level for Lambda logging."
  type        = string
  default     = null
}

variable "system_log_level" {
  description = "System log level for Lambda logging."
  type        = string
  default     = null
}

variable "log_group" {
  description = "CloudWatch Logs group used by the Lambda function."
  type        = string
  default     = null
}

variable "tracing_mode" {
  description = "AWS X-Ray tracing mode for the Lambda function."
  type        = string
  default     = "PassThrough"
}

variable "subnet_ids" {
  description = "List of subnet IDs where the Lambda function will run."
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of security group IDs attached to the Lambda function."
  type        = list(string)
  default     = []
}

variable "ipv6_allowed_for_dual_stack" {
  description = "Whether the Lambda VPC configuration allows IPv6 dual-stack."
  type        = bool
  default     = false
}

variable "replace_security_groups_on_destroy" {
  description = "Whether Lambda replaces security groups during destruction."
  type        = bool
  default     = null
}

variable "tags" {
  description = "Tags to apply to the Lambda function."
  type        = map(string)
  default     = {}
}
