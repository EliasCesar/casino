output "vpc_app_id" {
  value = aws_vpc.app.id
}

output "vpc_rds_id" {
  value = aws_vpc.rds.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "private_rds_subnet_ids" {
  value = aws_subnet.private_rds[*].id
}