resource "aws_instance" "app_server" {
  for_each               = var.instance_names
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  # iam_instance_profile   = var.iam_profile_name

  # user_data = file("./modules/jenkins/install_jenkins.sh")

  tags = {
    Name = each.value.name
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "Jenkins Security Group"
  description = "Allow 8080 access"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = ["8080", "22", "80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}