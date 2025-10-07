variable "env" {
  type = string
}
variable "region" {
  type = string
}


# ec2 ------------------------------------------------------


# variable "instance_number" {
#   type = number
# }
# variable "user_data" {
#   type = string
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
# variable "healthcheck_path" {
#   type = string
# }
# variable "protocol" {
#   type = string
# }
# variable "target_type" {

#   type = string

# }
# variable "interval_time_second" {
#  type = number
# }

# variable "cpu_size" {
#   type = number
# }
# variable "memory_size" {
#   type = number
# }

# variable "task_defination_name" {
#   type = string

# }
# variable "container_name" {
#   type = string
# }
# variable "deployment_minimum_percentage" {
#   type = number

# }
# variable "deployment_maximum_percent" {
#   type = number

# }
# variable "maxtask" {
#   type = number

# }
# variable "mintask" {
#   type = number

# }
# variable "cpuutilization_percentage" {
#   type = number

# }
# variable "scalintime" {
#   type = number
# }

# variable "scalouttime" {
#   type = number
# }

# variable "elb_target_port" {
#   type = number
# }
# vpc--------------------------------------------------------

variable "cidr_block_vpc" {
  type = string
}

variable "cidr_block_sn1" {
  type = list(string)
}
variable "availability_zone" {
  type = list(string)
}

variable "cidr_block_route" {
  type = string
}


# variable "ingress_cidr_blocks" {
#   type = list(string)
# }

# variable "egress_cidr_blocks" {
#   type = list(string)
# }

# variable "inbound_ports" {
#   type = list(number)
# }



#key pair -----------------------------------------------------------------------
variable "key_path" {
  type = string
}

variable "key_name" {
  type = string
}



# iam-role-------------------------------------------
variable "role_name" {
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



# kms-key---------------------------------------------------
# variable "deletion-day" {
#   type = number
# }
# variable "enable_key_rotation" {
#   type = string
# }
# variable "alias-name" {
#   type = string
# }

# security-group----------------------------------------------

variable "ingress_cidr_blocks" {
  type = list(string)
}

variable "egress_cidr_blocks" {
  type = list(string)
}

variable "inbound_ports" {
  type = list(number)
}

# rds ------------------------------------------------------

# variable "allocated_storage" {
#   type = number
# }

# variable "storage_type" {
#   type = string
# }

# variable "engine" {
#   type = string
# }

# variable "engine_version" {
#   type = string

# }

# variable "instance_class" {
#   type = string
# }
# variable "identifier" {
#   type = string
# }
# variable "username" {
#   type = string
# }
# variable "password" {
#   type = string
# }


# variable "db_name" {
#   type = string
# }

# variable "skip_final_snapshot" {
#   type = string

# }
# variable "apply_immediately" {
#   type = string
# }
# variable "backup_retention_period" {
#   type = number
# }
# variable "deletion_protection" {
#   type = string
# }

# variable "publicly_accessible" {
#   type = string
# }

# cloud watch --------------------------------------------

# variable "service_id" {
#   type = string
# }
# variable "type_of_graph" {
#   type = string
# }
# variable "cpu_widget_position" {
#   type = object({
#     type   = string
#     x      = number
#     y      = number
#     width  = number
#     height = number
#   })
# }

# variable "service_name" {
#   type = string
# }

# variable "type_mantioned" {
#   type = string
# }

# variable "period" {
#   type = number
# }
# variable "stat" {
#   type = string
# }





# variable "networkin_widget_position" {
#   type = object({
#     type   = string
#     x      = number
#     y      = number
#     width  = number
#     height = number
#   })
# }

# variable "markdown" {
#   type = string
# }
# variable "text_widget_position" {
#   type = object({
#     type   = string
#     x      = number
#     y      = number
#     width  = number
#     height = number
#   })
# }

# variable "type_of_metrics" {
#   type = object({
#     first_metrics = string
#     second_metrics = string

#   })
# }

# # for alarm--------
# variable "alarm_name" {
#   type = string 
# }

# variable "comparison_operator" {
#   type = string
# }

# variable "evaluation_periods" {
#   type = number
# }
# variable "threshold" {
#   type = number
# }

# variable "alarm_description" {
#   type = string
# }






# -------------------------------------------------------------------------------
# use it if requirement is "go with object base approch"
# variable "env" {
#   default = "dev"
#   type = string
# }

# -----------------------------------------------------------------------------
# elastic bean stack


# variable "language" {
#   type = string

# }

# variable "vpc_id" {
#   type = string

# }

# variable "subnet" {
#   type = list(string)
# }

# variable "ebs_instance_type" {
#   type = string
# }

# variable "solution_stack_name" {
#   type = string
# }

# variable "app_zip_path" {
#   type = string
# }

# variable "ebs_role_name" {
#   type = string
# }

# variable "bucket_id" {
#   type = string

# }
# variable "instace_profile_role_name" {
#   type = string
# }

# variable "key" {
#   type = string

# }

# variable "ebs_name" {
#   type = string

# }
# variable "version_name" {
#   type = string

# }
# variable "environment_name" {
#   type = string

# }
# variable "tier" {
#   type = string

# }

# variable "autoscaling_namespace" {
#   type = string

# }
# variable "autoscaling_name" {
#   type = string

# }

# variable "vpc_name_space" {
#   type = string

# }

# variable "ebs_instance_type" {
#   type = string
# }

# variable "public_access" {
#   type = string
# }

# # s3-----------------------------------
variable "bucket_name" {
  type = string
}

# --------------------------------------------------------------
# ---------- General Variables ----------
variable "region" {
  description = "AWS region to deploy Elastic Beanstalk"
  type        = string
}

variable "bucket_id" {
  description = "S3 bucket ID where the application ZIP will be stored"
  type        = string
}

variable "key" {
  description = "S3 key for the uploaded ZIP file"
  type        = string
}

variable "app_zip_path" {
  description = "Path to the local application ZIP file"
  type        = string
}

variable "ebs_name" {
  description = "Elastic Beanstalk application name"
  type        = string
}

variable "version_name" {
  description = "Application version name"
  type        = string
}

variable "environment_name" {
  description = "Elastic Beanstalk environment name"
  type        = string
}

variable "solution_stack_name" {
  description = "Solution stack name for Elastic Beanstalk (e.g., Node.js 22 running on 64bit Amazon Linux 2023)"
  type        = string
}

variable "tier" {
  description = "Elastic Beanstalk environment tier (WebServer or Worker)"
  type        = string
}

# ---------- Networking ----------
variable "vpc_id" {
  description = "VPC ID where Elastic Beanstalk will be deployed"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for Elastic Beanstalk environment"
  type        = list(string)
}

# ---------- EC2 & IAM ----------
variable "ebs_instance_type" {
  description = "EC2 instance type for the environment"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name used by Elastic Beanstalk EC2 instances"
  type        = string
}

variable "public_access" {
  description = "Whether to assign a public IP (true/false)"
  type        = string
}

# efs----------------------------------------------------------

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
  default = "true"
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



