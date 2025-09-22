variable "env" {
  type = string
}
variable "region" {
  type = string
}


# ec2 ------------------------------------------------------


variable "instance_number" {
  type = number
}
variable "user_data" {
  type = string
}

variable "ami_types" {
  type = string
}
variable "instance_type" {
  type = string
}

# iam ---------------------------------------------------------------------------

# variable "username" {
#   type = string
# }
# variable "policy_name" {
#   type    = string
#   default = "default_policy_name"
# }
# variable "iam_actions" {
#   type = list(string)
# }
# lambda--------------------------------------------------------------------------
# variable "function_name" {
#   type    = string
#   default = "default_name"
# }

# variable "role_name" {
#   type    = string
#   default = "default_role_name"
# }

# variable "policy_name" {
#   type    = string
#   default = "default_policy_name"
# }

# variable "file_name" {
#  type = string
# }

# variable "output_path" {
#   type = string
# }
# ecs----------------------------------------------------------------------------


# variable "image" {
#   type = string
# }
# variable "containerport" {
#   type = number
# }
# variable "desired_count" {
#   type = number
# }
# variable "runtime" {
#   type = string
# }
# vpc--------------------------------------------------------


variable "cidr_block_vpc" {
  type = string
}

variable "cidr_block_sn1" {
  type = string
}
variable "availability_zone" {
  type = string
}

variable "cidr_block_route" {
  type = string
}

variable "inbound_ports" {
  type = list(number)
}

variable "ingress_cidr_blocks" {
  type = list(string)
}

variable "egress_cidr_blocks" {
  type = list(string)
}

#key pair -----------------------------------------------------------------------
variable "key_path" {
  type = string
}

variable "key_name" {
  type = string
}



# iam-role-------------------------------------------
variable "role_name"{
    type = string
}

variable "service" {
  type = string
}
variable "policy_name" {
  type = string
}
variable "actions" {
  type = list(string)
}


# -------------------------------------------------------------------------------
# use it if requirement is "go with object base approch"
# variable "env" {
#   default = "dev"
#   type = string
# }

