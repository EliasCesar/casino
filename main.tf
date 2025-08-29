provider "aws" {
  region = "ca-central-1"
}

resource "random_id" "hash" {
  byte_length = 2
}

resource "random_password" "rds_master" {
  length  = 12
  special = true
  override_special = "!#$%&()*+,-.:;<=>?[]^_{|}~"
}

# --- VPC de Aplicaciones ---
module "network" {
  source                    = "./modules/network"
  vpc_app_cidr              = var.vpc_app_cidr
  vpc_rds_cidr              = var.vpc_rds_cidr
  public_subnets            = var.public_subnets
  private_subnets           = var.private_subnets
  private_rds_subnets       = var.private_rds_subnets
  tags                      = var.tags
  availability_zones        = var.availability_zones
  vpc_app_name              = "vpc-app-${var.tags["projectId"]}-${var.tags["workload"]}-${random_id.hash.hex}-${var.tags["region"]}"
  vpc_rds_name              = "vpc-rds-${var.tags["projectId"]}-${var.tags["workload"]}-${random_id.hash.hex}-${var.tags["region"]}"
  subnet_private_app_name   = "subnet-app-private-${var.tags["projectId"]}-${var.tags["workload"]}-${random_id.hash.hex}-${var.tags["region"]}"
  igw_app_name              = "igw-app-${var.tags["projectId"]}-${var.tags["workload"]}-${random_id.hash.hex}-${var.tags["region"]}"
  subnet_public_app_name    = "subnet-app-public-${var.tags["projectId"]}-${var.tags["workload"]}-${random_id.hash.hex}-${var.tags["region"]}"
  subnet_rds_name           = "subnet-rds-${var.tags["projectId"]}-${var.tags["workload"]}-${random_id.hash.hex}-${var.tags["region"]}"
}

# --- RDS en VPC  ---
module "rds" {
  source = "./modules/rds"
    cluster_identifier            = "rds-${var.tags["projectId"]}-${var.tags["workload"]}-${random_id.hash.hex}-${var.tags["region"]}"
    engine                        = var.rds_engine
    engine_mode                   = var.rds_engine_mode
    engine_version                = var.rds_engine_version
    master_username               = var.rds_master_username
    master_password               = random_password.rds_master.result
    database_name                 = var.rds_database_name
    backup_retention_period       = var.rds_backup_retention_period
    preferred_backup_window       = var.rds_preferred_backup_window
    preferred_maintenance_window  = var.rds_preferred_maintenance_window
    security_group_ids            = [aws_security_group.rds.id]
    private_rds_subnets           = module.network.private_rds_subnet_ids
    storage_encrypted             = var.rds_storage_encrypted
    deletion_protection           = var.rds_deletion_protection
    enable_http_endpoint          = var.rds_enable_http_endpoint
    instance_count                = var.rds_instance_count
    instance_class                = var.rds_instance_class
    publicly_accessible           = var.rds_publicly_accessible
    tags                          = var.tags
}

resource "aws_security_group" "rds" {
  name        = "rds-allow-app"
  description = "Allow inbound traffic to RDS only from VPC app"
  vpc_id      = module.network.vpc_rds_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.vpc_app_cidr]
    description = "Allow PostgreSQL from VPC app"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = var.tags
}

resource "random_id" "rds" {
  byte_length = 2
}

# --- Secret manager en RDS  ---
module "rds_password_secret" {
  source            = "./modules/secrets"
  secret_name       = "rds-master-password"
  secret_description = "RDS master password managed by Terraform"
  secret_string     = random_password.rds_master.result
  tags              = var.tags
}