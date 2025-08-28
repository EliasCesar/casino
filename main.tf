provider "aws" {
  region = "ca-central-1"
}

resource "random_id" "hash" {
  byte_length = 2
}

module "network" {
  source          = "./modules/network"
  vpc_app_cidr    = var.vpc_app_cidr
  vpc_rds_cidr    = var.vpc_rds_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  tags            = var.tags
  vpc_app_name    = "app-vpc-${var.tags["projectId"]}-${var.tags["workload"]}-${random_id.hash.hex}-${var.tags["region"]}"
  vpc_rds_name    = "app-rds-${var.tags["projectId"]}-${var.tags["workload"]}-${random_id.hash.hex}-${var.tags["region"]}"
}