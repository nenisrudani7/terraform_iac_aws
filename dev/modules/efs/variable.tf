variable "creation_token" {
  type = string
}
variable "performance_mode" {
  type = string
}

variable "throughput_mode" {
  type = string
}
variable "lifecycle_policy" {
  type = string
}

variable "encrypted" {
  type = string
}

variable "env" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
variable "security_groups_id" {
  type = string
}

