# key pair-------------------------------------------

# module "key_pair" {
#   source   = "./modules/key_pair"
#   env      = var.env
#   key_path = var.key_path
#   key_name = var.key_name
# }
# ec2-------------------------------------------------

# module "ec2" {
#   source            = "./modules/ec2"
#   env               = var.env
#   # cidr_block_vpc    = module.vpc.cidr_block_vpc
#   # cidr_block_sn1    = var.cidr_block_sn1
#   instance_number   = var.instance_number
#   ami_types         = var.ami_types
#   instance_type     = var.instance_type
#   # to connect it with existing vpc
#   subnet_id         = module.vpc.subnet_id
#   security_group_id = module.security_group.sg_groups_id
#   # key_pair          = module.key_pair.aws_key_pair
#   key_name          = module.key_pair.aws_key_pair
#   user_data         = var.user_data
#   availability_zone = module.vpc.availability_zone

# }

# -s3---------------------------------------------------



module "s3" {
  source = "./modules/s3"
  bucket_name = var.bucket_name
  env = var.env
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
# module "ecs" {
#   source                        = "./modules/ecs"
#   env                           = var.env
#   image                         = var.image
#   containerport                 = var.containerport
#   desired_count                 = var.desired_count
#   region                        = var.region
#   elb_target_port               = var.elb_target_port
#   healthcheck_path              = var.healthcheck_path
#   protocol                      = var.protocol
#   target_type                   = var.target_type
#   interval_time_second          = var.interval_time_second
#   cpu_size                      = var.cpu_size
#   memory_size                   = var.memory_size
#   task_defination_name          = var.task_defination_name
#   container_name                = var.container_name
#   deployment_maximum_percent    = var.deployment_maximum_percent
#   deployment_minimum_percentage = var.deployment_minimum_percentage
#   maxtask                       = var.maxtask
#   mintask                       = var.mintask
#   cpuutilization_percentage     = var.cpuutilization_percentage
#   scalintime                    = var.scalintime
#   scalouttime                   = var.scalouttime

# }

# vpc---------------------------------------------------
module "vpc" {
  source            = "./modules/vpc"
  env               = var.env
  cidr_block_vpc    = var.cidr_block_vpc
  cidr_block_sn1    = var.cidr_block_sn1
  availability_zone = var.availability_zone
  cidr_block_route  = var.cidr_block_route


  # ------same in sg no need to uncomment
  # inbound_ports       = var.inbound_ports
  # ingress_cidr_blocks = var.ingress_cidr_blocks
  # egress_cidr_blocks  = var.egress_cidr_blocks
}

# iam-role------------------------------------------

module "iam-role" {
  source      = "./modules/iam_role"
  role_name   = var.role_name
  env         = var.env
  service     = var.service
  policy_name = var.policy_name
  actions     = var.actions
}

# kms-key----------------------------------------

# module "kms-key" {
#   source              = "./modules/kms_key"
#   env                 = var.env
#   deletion-day        = var.deletion-day
#   enable_key_rotation = var.enable_key_rotation
#   alias-name          = var.alias-name
# }

# security group ----------------------------

module "security_group" {
  source              = "./modules/security_groups"
  env                 = var.env
  ingress_cidr_blocks = var.ingress_cidr_blocks
  egress_cidr_blocks  = var.egress_cidr_blocks
  inbound_ports       = var.inbound_ports
  vpc_id              = module.vpc.vpc_id
}

# -------------------------------------------------
# module "rds" {
#   source              = "./modules/rds"
#   allocated_storage   = var.allocated_storage
#   storage_type        = var.storage_type
#   engine              = var.engine
#   engine_version      = var.engine_version
#   instance_class      = var.instance_class
#   identifier          = var.identifier
#   username            = var.username
#   password            = var.password
#   publicly_accessible = var.publicly_accessible
#   # vpc_security_group_ids  = module.security_group.sg_groups_id
#   security_group_id       = module.security_group.sg_groups_id
#   db_subnet_group_name    = module.vpc.db_subnet_group
#   db_name                 = var.db_name
#   skip_final_snapshot     = var.skip_final_snapshot
#   apply_immediately       = var.apply_immediately
#   backup_retention_period = var.allocated_storage
#   deletion_protection     = var.deletion_protection
#   env                     = var.env

# }


# module "cloudwatch" {
#   source = "./modules/cloudwatch"

#   # Service info
#   service_id     = module.ec2.instance_id[0]
#   service_name   = var.service_name
#   type_mantioned = var.type_mantioned
#   type_of_metrics = var.type_of_metrics

#   # CloudWatch metric settings
#   period = var.period
#   stat   = var.stat
#   region = var.region
#   type_of_graph = var.type_of_graph

#   # Widget positions
#   cpu_widget_position       = var.cpu_widget_position
#   networkin_widget_position = var.networkin_widget_position
#   text_widget_position      = var.text_widget_position

#   # Text widget
#   markdown = var.markdown

#   # Alarm settings
#   alarm_name          = var.alarm_name
#   comparison_operator = var.comparison_operator
#   evaluation_periods  = var.evaluation_periods
#   threshold           = var.threshold
#   alarm_description   = var.alarm_description
# }



# -----------------------------------------------------
# Elastic Beanstalk Module
module "elastic_bs" {
  source = "./modules/elastic_bs"

  # General Config
  bucket_id            = module.s3.bucket_id
  key                  = var.key
  app_zip_path         = var.app_zip_path
  ebs_name             = var.ebs_name
  version_name         = var.version_name
  environment_name     = var.environment_name
  solution_stack_name  = var.solution_stack_name
  tier                 = var.tier

  # Networking
  vpc_id   = module.vpc.vpc_id
  subnets  = module.vpc.subnet_id

  # EC2 & IAM
  ebs_instance_type    = var.ebs_instance_type
  instance_profile_name = var.instance_profile_name
  public_access        = var.public_access
}

# ---EFS----------------------------------------------------------------

module "efs" {
  source = "./modules/efs"
  creation_token = var.creation_token
  performance_mode = var.performance_mode
  throughput_mode = var.throughput_mode
  lifecycle_policy = var.lifecycle_policy
  encrypted = var.encrypted
  env = var.env
  security_groups_id = module.security_group.sg_groups_id
  subnet_ids = module.vpc.subnet_id
}



