output "sg_name" {
  value = aws_security_group.app_security_group.name
}

output "sg_id" {
  value = aws_security_group.app_security_group.id
}