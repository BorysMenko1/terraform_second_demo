resource "aws_db_instance" "mysql_db" {
  allocated_storage      = 10
  db_name                = var.db_name
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = true
  publicly_accessible    = true
  # vpc_security_group_ids = [ var.vpc_security_group_ids ]
  # db_subnet_group_name   = var.db_subnet_group_name 
}