variable "allocated_storage" {
  type = number
}

variable "storage_type" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string

}

variable "instance_class" {
  type = string
}
variable "identifier" {
  type = string
}
variable "username" {
    type = string
}
variable "password" {
   type = string
}

variable "publicly_accessible" {
    type = string
}

variable "db_name" {
    type = string
}

variable "skip_final_snapshot" {
  type = string

}
variable "apply_immediately" {
    type = string
}
variable "backup_retention_period" {
    type = number
}
variable "deletion_protection" {
  type = string
}


variable "env" {
  type = string
}

variable "security_group_id"{}
variable "db_subnet_group_name" {
}