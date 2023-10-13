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
  default = "third_demo_key"
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

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.3.0/24"
  ]
}

variable "private_subnet_cidrs" {
  type = list(string)
  default = [
    "10.0.2.0/24",
    "10.0.4.0/24"
  ]
}