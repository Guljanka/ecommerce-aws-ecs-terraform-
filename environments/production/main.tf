
module "vpc" {
  source = "../../modules/vpc"

  project            = "ecommerce"
  environment        = "production"
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "security_group" {
  source = "../../modules/security-group"

  vpc_id      = module.vpc.vpc_id
  project     = "ecommerce"
  environment = "production"
}

module "ecs" {
  source = "../../modules/ecs"

  project     = "ecommerce"
  environment = "production"
}

module "alb" {
  source = "../../modules/alb"

  project     = "ecommerce"
  environment = "production"

  vpc_id = module.vpc.vpc_id

  public_subnets = [
    module.vpc.public_subnet_ids[0],
    module.vpc.public_subnet_ids[1],
    module.vpc.public_subnet_ids[2]
  ]

  alb_security_group_id = module.security_group.alb_security_group_id
}


module "ecs_service" {
  source = "../../modules/ecs-service"

  project     = "ecommerce"
  environment = "production"

  cluster_id   = module.ecs.cluster_id
  service_name = "ecommerce-production-service"

  redis_endpoint          = module.redis.redis_endpoint
  aurora_cluster_endpoint = module.rds_aurora.cluster_endpoint

  db_password_secret_arn = module.rds_aurora.master_user_secret_arn

  subnet_ids = [
    module.vpc.private_app_subnet_ids[0],
    module.vpc.private_app_subnet_ids[1],
    module.vpc.private_app_subnet_ids[2]
  ]

  security_group_id = module.security_group.app_security_group_id
  target_group_arn  = module.alb.target_group_arn
}

module "rds_aurora" {
  source = "../../modules/rds-aurora"

  project     = "ecommerce"
  environment = "production"

  vpc_id                  = module.vpc.vpc_id
  private_data_subnet_ids = module.vpc.private_data_subnet_ids
  rds_security_group_id   = module.security_group.db_security_group_id
}

module "redis" {
  source = "../../modules/redis"

  project     = "ecommerce"
  environment = "production"

  private_data_subnet_ids = module.vpc.private_data_subnet_ids
  redis_security_group_id = module.security_group.redis_security_group_id
}

module "ecr" {
  source      = "../../modules/ecr"
  project     = "ecommerce"
  environment = "production"
}
