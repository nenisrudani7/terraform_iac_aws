output "kms-key-arm" {
  value = aws_kms_alias.my_kms_alias.arn
}

variable "env" {}
variable "deletion-day" {
  type = number
}
variable "enable_key_rotation" {
  type = string
}
variable "alias-name" {
  type = string
}

resource "aws_kms_key" "my_kms_key" {
  deletion_window_in_days = var.deletion-day  
  enable_key_rotation     = var.enable_key_rotation

  tags = {
    Environment = var.env
    Name        = "${var.env}-kms-key"
  }
}

resource "aws_kms_alias" "my_kms_alias" {
  name          = "${var.env}-${var.alias-name}"
  target_key_id = aws_kms_key.my_kms_key.id
}
