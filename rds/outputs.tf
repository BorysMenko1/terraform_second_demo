output "rds_url" {
  value = aws_db_instance.mysql_db.address
}