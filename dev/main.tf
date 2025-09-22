key pair-------------------------------------------

module "key_pair" {
  source = "./modules/key_pair"
  env    = var.env
  key_path = var.key_path
}
# ec2-------------------------------------------------

# module "ec2" {
#   source            = "./modules/ec2"
#   env               = var.env
#   cidr_block_vpc    = var.cidr_block_sn1
#   cidr_block_sn1    = var.cidr_block_sn1
#   availability_zone = var.availability_zone
#   instance_number   = var.instance_number
#   ami_types         = var.ami_types
#   instance_type     = var.instance_type
# to connect it with existing vpc
#   subnet_id         = module.vpc.subnet_id
#   security_group_id = module.vpc.security_group_id
    key_pair = module.key_pair.aws_key_pair.value
#   region            = var.region
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
# module "ecs" {
#   source = "./modules/ecs"
#   env = var.env
#   image = var.image
#   containerport = var.containerport
#   desired_count = var.desired_count
#   region = var.region
# }

module "vpc" {
  source = "./modules/vpc"
  env = var.env
  cidr_block_vpc = var.cidr_block_vpc
  cidr_block_sn1 = var.cidr_block_sn1
  availability_zone = var.availability_zone
  cidr_block_route = var.cidr_block_route
  inbound_ports       = var.inbound_ports
  ingress_cidr_blocks = var.ingress_cidr_blocks
  egress_cidr_blocks  = var.egress_cidr_blocks
}