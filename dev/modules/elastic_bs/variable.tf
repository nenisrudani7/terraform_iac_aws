variable "bucket_id" {
  description = "S3 bucket where the application ZIP will be stored"
  type        = string
}

variable "key" {
  description = "S3 key (filename) for the uploaded ZIP file"
  type        = string
}

variable "app_zip_path" {
  description = "Path to your local application ZIP file"
  type        = string
}

variable "ebs_name" {
  description = "Elastic Beanstalk application name"
  type        = string
}

variable "version_name" {
  description = "Application version label for Elastic Beanstalk"
  type        = string
}

variable "environment_name" {
  description = "Elastic Beanstalk environment name"
  type        = string
}

variable "solution_stack_name" {
  description = "Platform stack (e.g., Node.js 22 running on 64bit Amazon Linux 2023)"
  type        = string
}

variable "tier" {
  description = "Elastic Beanstalk environment tier (WebServer or Worker)"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name for EC2 instances"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the environment will be launched"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs used by the environment"
  type        = list(string)
}

variable "ebs_instance_type" {
  description = "EC2 instance type for the Elastic Beanstalk environment"
  type        = string
}

variable "public_access" {
  description = "Whether to associate a public IP address (true/false)"
  type        = string
}
