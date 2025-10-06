output "public_ip" {
  value = module.ec2.public_ip
}
output "instance_id" {
  value = module.ec2.instance_id
}

# iam--------------------

# output "iam_user_name" {
#   value = module.iam.iam_user_name
# }
# output "iam_user_arn" {
#   value = module.iam.iam_user_arn
# }

# output "password" {
#   value     = module.iam.password
#   sensitive = true
# }
# output "secret" {
#   value     = module.iam.secret
#   sensitive = true
# }

# output "access_key" {
#   value = module.iam.access_key
# }

# output "console_login_url" {
#   value =  module.iam.console_login_url
# }

# vpc-----------------------------
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}
output "db_subnet_group" {
  value = module.vpc.db_subnet_group
}
output "availability_zone" {
  value = module.vpc.availability_zone
}
output "cidr_block_vpc" {
  value = module.vpc.cidr_block_vpc
}
output "key_pair" {
  value = module.key_pair.aws_key_pair
}
# iam_role---------------------
# output "role_arn"{
#   value = module.iam-role.role_arn  
# }

# /kms-key---------------
# output "kms-keys-arn"{
#   value = module.kms-key.a
# }

# security_group------------------
output "sg_groups_id" {
  value = module.security_group.sg_groups_id
}

# rds-----------------------------
# output "rds_endpoint" {
#   value = module.rds.rds_endpoint
# }


# --------------------------------------------------------------
# s3
output "bucket_name" {
  value = module.s3.bucket_id
}

# elastic_bs ------------------------------------------------------------------

output "url" {
  value = module.elastic_bs.url
}

output "domain" {
  value = module.elastic_bs.domain
}