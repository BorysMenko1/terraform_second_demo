variable "vpc_security_group_ids" {
  type = string
}

# variable "db_subnet_group_name" {
#   type = string
# }

variable "db_name" {
  type    = string
  default = "my_db"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "5.7"
}

variable "username" {
  type    = string
  default = "sonny"
}

variable "password" {
  type    = string
  default = "qwer1234"
}

variable "parameter_group_name" {
  type    = string
  default = "default.mysql5.7"
}