# key pair-------------------------------------------

module "key_pair" {
  source = "./modules/key_pair"
  env    = var.env
  key_path = var.key_path
  key_name = var.key_name
}
# ec2-------------------------------------------------

module "ec2" {
  source            = "./modules/ec2"
  env               = var.env
  cidr_block_vpc    = var.cidr_block_vpc
  cidr_block_sn1    = var.cidr_block_sn1
  availability_zone = var.availability_zone
  instance_number   = var.instance_number
  ami_types         = var.ami_types
  instance_type     = var.instance_type
# to connect it with existing vpc
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
  key_pair = module.key_pair.aws_key_pair
  key_name = module.key_pair.aws_key_pair
  user_data = var.user_data


}

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
elb_target_port = var.elb_target_port
   healthcheck_path = var.healthcheck_path
   protocol = var.protocol
   target_type = var.target_type
   interval_time_second = var.interval_time_second
   cpu_size = var.cpu_size
   memory_size = var.memory_size
   task_defination_name = var.task_defination_name
   container_name = var.container_name
   deployment_maximum_percent = var.deployment_maximum_percent
   deployment_minimum_percentage = var.deployment_minimum_percentage
   maxtask = var.maxtask
   mintask = var.mintask
   cpuutilization_percentage = var.cpuutilization_percentage
   scalintime = var.scalintime
   scalouttime = var.scalouttime
   
}

# vpc---------------------------------------------------
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

# iam-role------------------------------------------

module "iam-role" {
  source = "./modules/iam_role"
  role_name= var.role_name
  env = var.env
  service = var.service
  policy_name = var.policy_name
  actions = var.actions
}