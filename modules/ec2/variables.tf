variable "subnet_id" {}

variable "key_name" {}

variable "vpc_security_group_ids" {
  type = string
}

variable "vpc_security_group_name" {
  type = string
}

variable "iam_profile_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_ami" {
  type    = string
  default = "ami-0ab1a82de7ca5889c"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone where the infrastructure will be deployed"
  default     = "eu-central-1a"
}

variable "instance_names" {
  description = "Map of modules names to configuration."
  type        = map(any)
  default = {
    jenkins_master = {
      name = "jenkins_master"
    },
    jenkins_slave = {
      name = "jenkins_slave",
    }
  }
}