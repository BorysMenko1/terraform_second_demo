variable "vpc_id" {}

variable "sg_name" {
  type    = string
  default = "app_security_group"
}

variable "app_allowed_ports" {
  description = "List of allowed ports"
  type        = list(any)
  default     = ["80", "443", "22", "8080"]
}