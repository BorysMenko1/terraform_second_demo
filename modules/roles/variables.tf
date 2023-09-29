variable "policy_name" {
  type    = string
  default = "full_access_s3_ecr_ecs_policy"
}

variable "policy_description" {
  type    = string
  default = "Full access to S3, ECR, and ECS"
}

variable "role_name" {
  type    = string
  default = "my_jenkins_role"
}

variable "profile_name" {
  type    = string
  default = "my_jenkins_profile"
}