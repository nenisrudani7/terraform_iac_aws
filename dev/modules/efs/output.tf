output "efs_id" {
  description = "EFS File System ID"
  value       = aws_efs_file_system.efs.id
}

output "efs_dns" {
  description = "EFS DNS Name"
  value       = aws_efs_file_system.efs.dns_name
}
