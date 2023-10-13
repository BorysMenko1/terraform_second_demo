variable "subnet_id" {}

variable "key_name" {}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_ami" {
  type    = string
  default = "ami-0ab1a82de7ca5889c"
}

variable "instance_name" {
  description = "Instance name."
  type        = string
  default     = "vault_server"
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}