
variable "env" {
  type = string
}
variable "cidr_block_vpc" {
  type = string
}

variable "cidr_block_sn1" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "region" {
  type = string
}
variable "instance_number" {
  type = number
}

variable "ami_types" {
  type = string
}
variable "instance_type" {
  type = string
}


# -------------------------------------------------------------------------------
# use it if requirement is "go with object base approch"
# variable "env" {
#   default = "dev"
#   type = string
# }