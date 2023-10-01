locals {
  bucket_name = "retraining-secnd-demo-cc-tf"
  table_name  = "ccTf"

  ecr_repo_name = "ecr-repo"

  demo_app_cluster_name        = "demo-app-cluster"
  availability_zones           = ["eu-central-1a", "eu-central-1b","eu-central-1c"]
  demo_app_task_famliy         = "demo-app-task"
  container_port               = 5000
  demo_app_task_name           = "demo-app-task"
  ecs_task_execution_role_name = "demo-app-task-execution-role"

  application_load_balancer_name = "cc-demo-app-alb"
  target_group_name              = "cc-demo-alb-tg"

  demo_app_service_name = "cc-demo-app-service"
}