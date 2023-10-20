variable "subnet_id" {}

variable "key_name" {}

variable "vpc_id" {
  type = string
}

# variable "iam_profile_name" {
#   type = string
# }

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_ami" {
  type    = string
  default = "ami-0ab1a82de7ca5889c"
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