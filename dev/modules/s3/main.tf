
variable "bucket_name" {
  type = string
}
variable "env" {
  type = string
}
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = "${var.env}-My bucket"
    Environment = var.env
  }
}
output "bucket_id" {
  value = aws_s3_bucket.example.id
}