variable "identifier" {
  type    = string
  default = "flask-app-db"
}

# variable "vpc_security_group_ids" {
#   type = string
# }

variable "db_name" {
  type    = string
  # default = "my_db"
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

variable "db_username" {
  type    = string
  # default = "sonny"
}

variable "db_password" {
  type    = string
  # default = "qwer1234"
}

variable "parameter_group_name" {
  type    = string
  default = "default.mysql5.7"
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_name" {
  type    = string
  default = "rds-subnet-group"
}

variable "subnet_ids" {
  type = list(string)
}