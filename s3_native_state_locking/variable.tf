locals {
  env = "dev"
  bucket = "${local.env}-tfstate-bucket123"
  region = "us-east-1"
}


# variable "bucket_name" {
#   description = "The name of the S3 bucket for Terraform state"
#   type        = string
#   default = local.bucket
# }

# variable "env" {

#   type        = string
#   default     = local.env
# }
