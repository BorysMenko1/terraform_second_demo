variable "vpc_id" {}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr_b" {
  type    = string
  default = "10.0.2.0/24"
}

variable "route_table_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone where the infrastructure will be deployed"
  default     = "eu-central-1a"
}

variable "db_subnet_group_name" {
  type    = string
  default = "db subnet group"
}