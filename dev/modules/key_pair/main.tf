

resource "aws_key_pair" "keys" {
  key_name   = "${var.env}-key_pair"
  public_key = file(var.key_path)
  
  tags = {
    environment = var.env
  }
}

