resource "aws_db_subnet_group" "subnet" {
  name       = var.subnet_name
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "mysql_db" {
  identifier             = var.identifier
  allocated_storage      = 10
  db_name                = var.db_name
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  db_subnet_group_name   = aws_db_subnet_group.subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
}

resource "aws_security_group" "rds_sg" {
  name        = "RDS Security Group"
  description = "Allow 3306 access"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = ["3306"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}