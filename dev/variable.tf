variable "env" {
  type = string
}


# ec2 ------------------------------------------------------

# variable "cidr_block_vpc" {
#   type = string
# }

# variable "cidr_block_sn1" {
#   type = string
# }

# variable "availability_zone" {
#   type = string
# }

# variable "region" {
#   type = string
# }
# variable "instance_number" {
#   type = number
# }

# variable "ami_types" {
#   type = string
# }
# variable "instance_type" {
#   type = string
# }

# iam ---------------------------------------------------------------------------

# variable "username" {
#   type = string
# }
# variable "policy_name" {
#   type    = string
#   default = "default_policy_name"
# }

# lambda--------------------------------------------------------------------------
variable "function_name" {
  type    = string
  default = "default_name"
}

variable "role_name" {
  type    = string
  default = "default_role_name"
}

variable "policy_name" {
  type    = string
  default = "default_policy_name"
}

# -------------------------------------------------------------------------------
# use it if requirement is "go with object base approch"
# variable "env" {
#   default = "dev"
#   type = string
# }
