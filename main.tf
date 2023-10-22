module "jenkins_servers" {
  source = "./modules/jenkins"

  key_name                = module.my_key_pair.key_name
  subnet_id               = module.network.public_subnet_ids[0]
  vpc_id                  = module.network.vpc_id
}

module "ecs" {
  source = "./modules/ecs"

  demo_app_cluster_name = local.demo_app_cluster_name
  availability_zones    = local.availability_zones

  demo_app_task_famliy         = local.demo_app_task_famliy
  ecr_repo_url                 = module.ecr.repository_url
  container_port               = local.container_port
  demo_app_task_name           = local.demo_app_task_name
  ecs_task_execution_role_name = local.ecs_task_execution_role_name

  application_load_balancer_name = local.application_load_balancer_name
  target_group_name              = local.target_group_name
  demo_app_service_name          = local.demo_app_service_name
  vpc_id                         = module.network.vpc_id
  subnet_ids                     = module.network.public_subnet_ids
  region = var.region

  db_address  = module.rds.db_address
  account_id = data.vault_generic_secret.vault_aws_secret.data["account_id"]
}

module "vault" {
  source = "./modules/vault"

  key_name  = module.my_key_pair.key_name
  subnet_id = module.network.public_subnet_ids[0]
  vpc_id    = module.network.vpc_id
  vpc_cidr  = module.network.vpc_cidr
}

module "my_key_pair" {
  source = "./modules/key_pairs"
}

module "network" {
  source               = "./modules/network"
  vpc_cidr             = var.vpc_cidr
  env                  = var.env
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "ecr" {
  source = "./modules/ecr"

  ecr_repo_name = local.ecr_repo_name
}

module "rds" {
  source = "./modules/rds"

  subnet_ids = module.network.public_subnet_ids
  vpc_id     = module.network.vpc_id
  vpc_cidr   = var.vpc_cidr
  
  db_name     = data.vault_generic_secret.vault_db_secret.data["db_name"]
  db_username = data.vault_generic_secret.vault_db_secret.data["db_username"]
  db_password = data.vault_generic_secret.vault_db_secret.data["db_password"]
}

module "s3_beckend" {
  source      = "./modules/s3"
  bucket_name = local.bucket_name
  dynamo_name = local.dynamo_name
}