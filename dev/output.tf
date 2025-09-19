# output "public_ip" {
#   value = module.ec2.public_ip
# }


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

output "security_group_id" {
  value = module.vpc.security_group_id
}
