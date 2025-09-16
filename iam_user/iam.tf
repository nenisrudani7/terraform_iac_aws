resource "aws_iam_user" "lb" {
  name          = "ec2"
  force_destroy = true

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name
}

data "aws_iam_policy_document" "lb_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "lb_ro" {
  name   = "test"
  user   = aws_iam_user.lb.name
  policy = data.aws_iam_policy_document.lb_ro.json
}

resource "random_password" "pw" {
  length  = 16
  special = true
}

resource "aws_iam_user_login_profile" "terraform_user_console" {
  user                    = aws_iam_user.lb.name
  password                = random_password.pw.result
  password_reset_required = true
}

data "aws_caller_identity" "current" {}
