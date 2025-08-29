resource "aws_rds_cluster" "serverless" {
  cluster_identifier      = var.cluster_identifier
  engine                 = var.engine
  engine_mode            = var.engine_mode
  engine_version         = var.engine_version
  master_username        = var.master_username
  master_password        = var.master_password
  database_name          = var.database_name
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  storage_encrypted      = var.storage_encrypted
  deletion_protection    = var.deletion_protection
  enable_http_endpoint   = var.enable_http_endpoint
  tags                   = var.tags
}

resource "aws_rds_cluster_instance" "serverless_instance" {
  count                  = var.instance_count
  identifier             = "${var.cluster_identifier}-instance-${count.index + 1}"
  cluster_identifier     = aws_rds_cluster.serverless.id
  instance_class         = var.instance_class
  engine                 = var.engine
  engine_version         = var.engine_version
  publicly_accessible    = var.publicly_accessible
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  tags                   = var.tags
}

resource "aws_db_subnet_group" "rds" {
  name       = var.db_subnet_group_name
  subnet_ids = var.private_rds_subnets
  tags       = var.tags
}
