provider "aws" {
  region = "ca-central-1"
}

resource "random_id" "hash" {
  byte_length = 2
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