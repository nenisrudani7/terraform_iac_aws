variable "description" {
  type        = string
  description = "Description of the KMS key"
}

variable "key_name" {
  type        = string
  description = "Name tag for the KMS key"
}

variable "alias_name" {
  type        = string
  description = "Alias name for the KMS key (must start with 'alias/')"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., test-v2, prod, staging)"
}

variable "purpose" {
  type        = string
  description = "Purpose of the KMS key (e.g., s3-encryption, ecr-encryption, redis-encryption)"
}

variable "policy" {
  type        = string
  description = "KMS key policy JSON document"
}

variable "deletion_window_in_days" {
  type        = number
  description = "Duration in days before the key is deleted after destruction"
  default     = 10
}

variable "enable_key_rotation" {
  type        = bool
  description = "Enable automatic key rotation"
  default     = true
}

variable "multi_region" {
  type        = bool
  description = "Whether the key is multi-region"
  default     = false
}

variable "additional_tags" {
  type        = map(string)
  description = "Additional tags for the KMS key"
  default     = {}
}
