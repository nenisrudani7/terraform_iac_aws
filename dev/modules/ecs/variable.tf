variable "env" {
  type = string
}
variable "region" {
  type = string
}
variable "image" {
  type = string
}
variable "containerport" {
  type = number
}
variable "desired_count" {
  type = number
}
variable "elb_target_port" {
  type = number
}
variable "healthcheck_path" {
  type = string
}
variable "protocol" {
  type = string
}
variable "target_type" {
  type = string
  
}
variable "interval_time_second" {
 type = number
}

variable "cpu_size" {
  type = number
}
variable "memory_size" {
  type = number
}

variable "task_defination_name" {
  type = string
}
variable "container_name" {
  type = string
}
variable "deployment_minimum_percentage" {
  type = number

}
variable "deployment_maximum_percent" {
  type = number

}
variable "maxtask" {
  type = number
}
variable "mintask" {
  type = number

}
variable "cpuutilization_percentage" {
  type = number
  
}
variable "scalintime" {
  type = number
}

variable "scalouttime" {
  type = number
}