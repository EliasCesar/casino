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