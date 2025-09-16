resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = local.bucket



  tags = {
    Name        = local.bucket
    Environment = local.env
  }
}
