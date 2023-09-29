variable "demo_app_cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}

# variable "availability_zones" {
#   description = "eu-central-1a AZs"
#   type        = list(string)
# }

variable "demo_app_task_famliy" {
  description = "ECS Task Family"
  type        = string
}

variable "ecr_repo_url" {
  description = "ECR Repo URL"
  type        = string
}

variable "container_port" {
  description = "Container Port"
  type        = number
}

variable "demo_app_task_name" {
  description = "ECS Task Name"
  type        = string
}

variable "ecs_task_execution_role_name" {
  description = "ECS Task Execution Role Name"
  type        = string
}

variable "application_load_balancer_name" {
  description = "ALB Name"
  type        = string
}

variable "target_group_name" {
  description = "ALB Target Group Name"
  type        = string
}

variable "demo_app_service_name" {
  description = "ECS Service Name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

# variable "subnet_id_b" {
#     description = "Subnet ID"
#     type = string
# }

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}