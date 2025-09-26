
# instance-----------------------------------
resource "aws_instance" "demo" {
  count = var.instance_number
  
  key_name = var.key_name 
  ami = var.ami_types
  instance_type          = var.instance_type
  # availability_zone      = [var.availability_zone]
  #   availability_zone      = element(var.availability_zone, count.index)
  # subnet_id              = element(var.subnet_id, count.index)
  availability_zone = var.availability_zone[0]
  subnet_id         = var.subnet_id[0]

  vpc_security_group_ids = var.security_group_id
  # subnet_id              = [var.subnet_id]
  user_data = file(var.user_data)
  associate_public_ip_address = true
  tags = {
    environment = var.env
  }
}



# resource "aws_vpc" "my_vpc" {
#   cidr_block           = var.cidr_block_vpc
#   instance_tenancy     = "default"
#   enable_dns_support   = true
#   enable_dns_hostnames = true #to show output in output
#   tags = {
#     environment = var.env
#     Name = "${var.env}-my-terraform-vpc"
#   }
# }


# # subnet ---------------------------------
# resource "aws_subnet" "subnet" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = var.cidr_block_sn1
#   availability_zone = var.availability_zone

#   tags = {
#     Environment = var.env
#     Name = "my-${var.env}subnet"
#   }
# }

# # internate gatway----------------------------------
# resource "aws_internet_gateway" "ig" {
#   vpc_id = aws_vpc.my_vpc.id
#   tags = {
#     environment = var.env
#     Name = "${var.env}-internate gatway"
#   }
# }

# # route table -----------------------------------------
# resource "aws_route_table" "my_route_table" {
#   vpc_id = aws_vpc.my_vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.ig.id
#   }
#   tags = {
#     environment = var.env
#     Name = "${var.env}_route_table"
#   }
# }

# # route table associtation ------------------------------------------
# resource "aws_route_table_association" "my_subnet_assoc" {
#   subnet_id      = aws_subnet.subnet.id
#   route_table_id = aws_route_table.my_route_table.id
# }

# # security_group ------------------------------------------------------

# resource "aws_security_group" "security_group" {
#   name        = "terraform-security-groups"
#   description = "this is for terraform security"
#   vpc_id      = aws_vpc.my_vpc.id #interpolatoin : is a way inwhich you can inherit  or extract value from terrafrom block  it's also called dot object notesion    
  

#   #inbound rule 
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "SSH OPEN"
#   }

#   ingress {
#     from_port   = 8000
#     to_port     = 8000
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "8000 OPEN"
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "80 OPEN"
#   }
#   #outbound rule
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1" #semantically equivalent to all ports
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     environment = var.env
#     name = "${var.env}-terraform-sg"
#   }
# }