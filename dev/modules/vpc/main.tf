resource "aws_vpc" "my_vpc" {
  cidr_block           = var.cidr_block_vpc
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true #to show output in output
  tags = {
    environment = var.env
    Name = "${var.env}-my-terraform-vpc"
  }
}
# subnet ---------------------------------
resource "aws_subnet" "subnet" {
  count = length(var.cidr_block_sn1)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.cidr_block_sn1[count.index]
  availability_zone = var.availability_zone[count.index]
  

  tags = {
    Environment = var.env
     Name        = "my-${var.env}-subnet-${count.index + 1}"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.env}-db-subnet-group"
  subnet_ids = aws_subnet.subnet[*].id

  tags = {
    Name        = "${var.env}-db-subnet-group"
    Environment = var.env
  }
}

# internate gatway----------------------------------
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    environment = var.env
    Name = "${var.env}-internate gatway"
  }
}
# route table -----------------------------------------
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = var.cidr_block_route
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    environment = var.env
    Name = "${var.env}_route_table"
  }
}
# route table associtation ------------------------------------------
resource "aws_route_table_association" "my_subnet_assoc" {
  count          = length(var.cidr_block_sn1)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.my_route_table.id
}

# resource "aws_security_group" "security_group" {
  
# }





# security_group ------------------------------------------------------

# resource "aws_security_group" "security_group" {
#   name        = "${var.env}-terraform-security-groups"
#   description = "this is for terraform security"
#   vpc_id      = aws_vpc.my_vpc.id #interpolatoin : is a way inwhich you can inherit  or extract value from terrafrom block  it's also called dot object notesion    
  

#   #inbound rule 
#    dynamic "ingress" {
#     for_each = var.inbound_ports
#     content {
#       from_port   = ingress.value
#       to_port     = ingress.value
#       protocol    = "tcp"
#       cidr_blocks = var.ingress_cidr_blocks
#       description = "Port -${ingress.value}- open"
#     }
#   }

#   #outbound rule
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1" #semantically equivalent to all ports
#    cidr_blocks = var.egress_cidr_blocks
#   }
#   tags = {
#     environment = var.env
#     name = "${var.env}-terraform-sg"
#   }
# }
