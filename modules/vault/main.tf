resource "aws_instance" "app_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.vault_sg.id]

  user_data = file("./modules/vault/install_vault.sh")

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "vault_sg" {
  name        = "Vault Security Group"
  description = "Allow 8200 access"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = ["8200", "22", "80", "443"]
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