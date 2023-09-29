resource "aws_instance" "app_server" {
  for_each               = var.instance_names
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  iam_instance_profile   = var.iam_profile_name

  user_data = file("./modules/ec2/install_jenkins.sh")

  tags = {
    Name = each.value.name
  }
}