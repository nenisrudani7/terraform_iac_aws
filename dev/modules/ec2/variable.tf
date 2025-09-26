variable "env" {
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

# to connecte it with existing vpc
variable "subnet_id" {
  type = list(string)
}

variable "security_group_id" {
  type = list(string)

}
variable "availability_zone" {
   type = list(string)
}

variable "key_name" {
   type = string
}


variable "user_data" {   
  type = string  
}

# -----------------------------------------------------------------------------------------
# use if requirement is "go with object base approch"
# variable "ec2_config" {
#   type = object({
#     instance_type = strings
#     env           = string
#     name          = string

#   })
# }