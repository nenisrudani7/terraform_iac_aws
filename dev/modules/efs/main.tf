
# Create the EFS File System
resource "aws_efs_file_system" "efs" {
  creation_token = var.creation_token
    performance_mode = var.performance_mode
    throughput_mode  = var.throughput_mode

  lifecycle_policy {
    transition_to_ia = var.lifecycle_policy
  }

  encrypted = true

  tags = {
    Name        = "${var.env}efs-tf"
    Environment = var.env
}
}

# Create Mount Targets for each subnet
resource "aws_efs_mount_target" "efs_mount" {
  for_each        = toset(var.subnet_ids)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = each.value
  security_groups = [var.security_groups_id]
}




variable "vpc_id" {
  type    = string
  default = "vpc-00fa2c67b20057328"
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-0be8637d2ab8bdcc8", "subnet-024117b4a50af80cc"]
}
# to crearte efs we need a vpc subnet and efs 