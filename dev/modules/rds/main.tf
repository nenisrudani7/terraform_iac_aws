resource "aws_db_instance" "rds-sql" {
  allocated_storage       = var.allocated_storage
  storage_type            = var.storage_type
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  identifier              = var.identifier
  username                = var.username
  password                = var.password
  vpc_security_group_ids  = var.security_group_id
  
  db_subnet_group_name    = var.db_subnet_group_name
  publicly_accessible     = var.publicly_accessible
  db_name                 = var.db_name
  skip_final_snapshot     = var.skip_final_snapshot
  apply_immediately       = var.apply_immediately
  backup_retention_period = var.allocated_storage
  deletion_protection     = var.deletion_protection

  
  tags = {
    name = "${var.env}-rds"
    Environment = var.env
  }
}

