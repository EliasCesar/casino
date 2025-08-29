output "rds_cluster_id" {
  value = aws_rds_cluster.serverless.id
}

output "rds_cluster_endpoint" {
  value = aws_rds_cluster.serverless.endpoint
}

output "rds_cluster_reader_endpoint" {
  value = aws_rds_cluster.serverless.reader_endpoint
}

output "rds_cluster_arn" {
  value = aws_rds_cluster.serverless.arn
}

output "rds_cluster_instances" {
  value = aws_rds_cluster_instance.serverless_instance[*].id
}

output "rds_cluster_instance_endpoints" {
  value = aws_rds_cluster_instance.serverless_instance[*].endpoint
}

output "rds_cluster_instance_arns" {
  value = aws_rds_cluster_instance.serverless_instance[*].arn
}
