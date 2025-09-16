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
variable "instance_number" {
  type = number
}
variable "ami_types" {
  type = string
}

variable "instance_type" {
  type = string
}




# -----------------------------------------------------------------------------------------
# use if requirement is "go with object base approch"
# variable "ec2_config" {
#   type = object({
#     instance_type = string
#     env           = string
#     name          = string

#   })
# }