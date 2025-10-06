variable "region" {
 type = string
}

variable "language" {
     type = string
}

variable "vpc_id" {
 type = string
}

variable "subnet" {
  type = list(string)
}

variable "instance_type" {
 type = string                      
}

variable "solution_stack_name" {
#   default = "Node.js 22 running on 64bit Amazon Linux 2023"
  type = string

}

variable "app_zip_path" {
   type = string
}

variable "ebs_role_name" {
  type = string

}

variable "bucket_id" {
  type = string

}
variable "instace_profile_role_name" {
  type = string
}

variable "key" {
  type = string

}

variable "ebs_name" {
  type = string

}
variable "version_name" {
   type = string
 
}
variable "environment_name" {
  type = string
  
}
variable "tier" {
  type = string
 
}

variable "autoscaling_namespace" {
  type = string
}
variable "autoscaling_name" {
  type = string
 
}

variable "vpc_name_space" {
  type = string

}

variable "ebs_instance_type" {
  type = string
}

variable "public_access" {
  type = string
}



