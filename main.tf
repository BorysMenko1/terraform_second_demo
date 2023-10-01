# module "jenkins_servers" {
#   source = "./modules/ec2"

#   key_name                = module.my_key_pair.key_name
#   subnet_id               = module.my_subnet.subnet_id
#   vpc_security_group_ids  = module.security_group.sg_id
#   vpc_security_group_name = module.security_group.sg_name
#   iam_profile_name        = module.iam_role.profile_name
# }

module "ecsCluster" {
  source = "./modules/ecs"

  demo_app_cluster_name = local.demo_app_cluster_name
  availability_zones    = local.availability_zones

  demo_app_task_famliy         = local.demo_app_task_famliy
  ecr_repo_url                 = module.ecrRepo.repository_url
  container_port               = local.container_port
  demo_app_task_name           = local.demo_app_task_name
  ecs_task_execution_role_name = local.ecs_task_execution_role_name

  application_load_balancer_name = local.application_load_balancer_name
  target_group_name              = local.target_group_name
  demo_app_service_name          = local.demo_app_service_name
}


module "my_key_pair" {
  source = "./modules/key_pairs"
}

module "iam_role" {
  source = "./modules/roles"
}

module "my_vcp" {
  source = "./modules/vpc"
}

module "my_subnet" {
  source = "./modules/subnet"

  vpc_id     = module.my_vcp.vpc_id
  depends_on = [module.my_vcp]
}

module "security_group" {
  source = "./modules/sg"

  vpc_id = module.my_vcp.vpc_id
}

module "ecrRepo" {
  source = "./modules/ecr"

  ecr_repo_name = local.ecr_repo_name
}