variable "role_name"{
    type = string
}

variable "service" {
  type = string
}

variable "env" {
  type = string
}
variable "policy_name" {
  type = string
}
variable "actions" {
  type = list(string)
}