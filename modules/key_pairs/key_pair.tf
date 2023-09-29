resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "public_key" {
  key_name   = var.key_pare_name
  public_key = tls_private_key.private_key.public_key_openssh
  depends_on = [tls_private_key.private_key]
}

resource "local_file" "second_demo_key" {
  content         = tls_private_key.private_key.private_key_pem
  filename        = "${aws_key_pair.public_key.key_name}.pem"
  file_permission = var.file_permission
  depends_on      = [aws_key_pair.public_key]
}
