output "vpc_id" {
  value = module.vpc.vpc_id
}

output "aurora_cluster_endpoint" {
  value = module.rds_aurora.cluster_endpoint
}

output "aurora_reader_endpoint" {
  value = module.rds_aurora.cluster_reader_endpoint
}

output "alb_dns_name_" {
  value = module.alb.alb_dns_name
}

output "redis_endpoint" {
  value = module.redis.redis_endpoint
}

output "redis_port" {
  value = module.redis.redis_port
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}
