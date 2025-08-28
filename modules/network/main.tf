resource "aws_vpc" "app" {
  cidr_block = var.vpc_app_cidr
  tags       = var.tags
}

resource "aws_vpc" "rds" {
  cidr_block = var.vpc_rds_cidr
  tags       = var.tags
}

resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = aws_vpc.app.id
  peer_vpc_id   = aws_vpc.rds.id
  auto_accept   = true
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.app.id
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  tags                    = var.tags
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.app.id
  cidr_block = var.private_subnets[count.index]
  tags       = var.tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.app.id
  tags  = var.tags
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  tags          = var.tags
  }

  resource "aws_eip" "nat" {
    domain = "vpc"
  }

output "vpc_app_id" {
  value = aws_vpc.app.id
}

output "vpc_rds_id" {
  value = aws_vpc.rds.id
}
