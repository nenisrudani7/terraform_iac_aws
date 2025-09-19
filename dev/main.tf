# module "ec2" {
#   source            = "./modules/ec2"
#   env               = var.env
#   cidr_block_vpc    = var.cidr_block_sn1
#   cidr_block_sn1    = var.cidr_block_sn1
#   availability_zone = var.availability_zone
#   instance_number   = var.instance_number
#   ami_types         = var.ami_types
#   instance_type     = var.instance_type

# }

# iam-----------------------------------------------

# module "iam" {
#   source      = "./modules/iam"
#   username    = var.username
#   policy_name = var.policy_name
# }

# lambda----------------------------------------------
# module "Lambda" {
#   env           = var.env
#   source        = "./modules/lambda"
#   function_name = var.function_name
#   role_name     = var.role_name
#   policy_name   = var.policy_name
# }

# ecs-------------------------------------------------
module "ecs" {
  source = "./modules/ecs"
  env = var.env
  image = var.image
  containerport = var.containerport
  desired_count = var.desired_count
  region = var.region
}

