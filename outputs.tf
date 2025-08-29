output "vpc_app_id" {
  value = module.network.vpc_app_id
}

output "vpc_rds_id" {
  value = module.network.vpc_rds_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "private_rds_subnet_ids" {
  value = module.network.private_rds_subnet_ids
}

output "rds_cluster_id" {
  value = module.rds.rds_cluster_id
}

output "rds_cluster_endpoint" {
  value = module.rds.rds_cluster_endpoint
}

output "rds_cluster_reader_endpoint" {
  value = module.rds.rds_cluster_reader_endpoint
}

output "rds_cluster_arn" {
  value = module.rds.rds_cluster_arn
}

output "rds_cluster_instances" {
  value = module.rds.rds_cluster_instances
}

output "rds_cluster_instance_endpoints" {
  value = module.rds.rds_cluster_instance_endpoints
}

output "rds_cluster_instance_arns" {
  value = module.rds.rds_cluster_instance_arns
}

output "rds_password_secret_id" {
  value = module.rds_password_secret.secret_id
}

output "rds_password_secret_arn" {
  value = module.rds_password_secret.secret_arn
}

output "rds_password_secret_version_id" {
  value = module.rds_password_secret.secret_version_id
}

output "redis_cluster_id" {
  value = module.redis.redis_cluster_id
}

output "redis_endpoint" {
  value = module.redis.redis_endpoint
}

output "redis_port" {
  value = module.redis.redis_port
}

output "redis_subnet_group_name" {
  value = module.redis.redis_subnet_group_name
}