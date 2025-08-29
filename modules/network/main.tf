resource "aws_vpc" "app" {
  cidr_block = var.vpc_app_cidr
  tags       = merge(var.tags, { Name = "${var.vpc_app_name}" })
}

resource "aws_vpc" "rds" {
  cidr_block = var.vpc_rds_cidr
  tags       = merge(var.tags, { Name = "${var.vpc_rds_name}" })
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
  availability_zone       = var.availability_zones[count.index]
  tags                    = merge(var.tags, { Name = "${var.subnet_public_app_name}" })
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.app.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  tags       = merge(var.tags, { Name = "${var.subnet_private_app_name}" })
}
  // ...existing code...

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.app.id
  tags  = merge(var.tags, { Name = "${var.igw_app_name}" })
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  tags          = var.tags
  }

resource "aws_subnet" "private_rds" {
  count      = length(var.private_rds_subnets)
  vpc_id     = aws_vpc.rds.id
  cidr_block = var.private_rds_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  tags       = merge(var.tags, { Name = "${var.subnet_rds_name}" })
}

resource "aws_eip" "nat" {
  domain = "vpc"
}