output "iam_user_name" {
  value = aws_iam_user.iam_user_name.name
  description = "IAM username"
  sensitive = false
}

output "iam_user_arn" {
  value = aws_iam_user.iam_user_name.arn
  description = "IAM user ARN"
  sensitive = false
}

output "password" {
  value     = aws_iam_user_login_profile.credentials.password
  sensitive = true
}

output "secret" {
  value     = aws_iam_access_key.credentials.secret
  sensitive = true
}


output "access_key" {
  value = aws_iam_access_key.credentials.id
}

output "console_login_url" {
  value       = "https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console"
  description = "Account-specific AWS console signin URL"
  sensitive   = false
}
