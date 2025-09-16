module "ec2" {
  source            = "./modules/ec2"
  env               = var.env
  cidr_block_vpc    = var.cidr_block_sn1
  cidr_block_sn1    = var.cidr_block_sn1
  availability_zone = var.availability_zone
  instance_number   = var.instance_number
  ami_types         = var.ami_types
  instance_type     = var.instance_type

}

