variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone where the infrastructure will be deployed"
  default     = "eu-central-1a"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_pare_name" {
  type    = string
  default = "first_demo_key"
}

variable "instance_AMI" {
  type    = string
  default = "ami-0ab1a82de7ca5889c"
}

variable "app_allowed_ports" {
  description = "List of allowed ports"
  type        = list(any)
  default     = ["80", "443", "22", "8080"]
}

variable "db_name" {
  type    = string
  default = "ami-0ab1a82de7ca5889c"
}

variable "db_username" {
  type    = string
  default = "ami-0ab1a82de7ca5889c"
}

variable "db_password" {
  type    = string
  default = "ami-0ab1a82de7ca5889c"
}