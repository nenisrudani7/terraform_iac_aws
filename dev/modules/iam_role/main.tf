resource "aws_iam_role" "test_role" {
  name = "${var.env}-${var.role_name}"


  assume_role_policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "${var.service}.amazonaws.com"
                ]
            }
        }
    ]
}
  )

  tags = {
    Environment = var.env
  }
}

resource "aws_iam_policy" "service_access" {
  name        = "${var.env}-${var.policy_name}"


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = var.actions
        Resource = "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "attach_policies" {
  role       = aws_iam_role.test_role.name
  policy_arn = aws_iam_policy.service_access.arn
}
