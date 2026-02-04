resource "aws_ecr_repository" "blackink" {
  name                 = var.repo_name
  image_tag_mutability = "IMMUTABLE"

#   encryption_configuration {
#     encryption_type = var.kms_key_arn != null ? "KMS" : "AES256"
#     # kms_key         = var.kms_key_arn
#   }

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "blackink-ECR-Repo"
  }
}

resource "aws_ecr_lifecycle_policy" "bit_lifecycle" {
  repository = aws_ecr_repository.blackink.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep only the most recent images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = var.image_retention_count
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}