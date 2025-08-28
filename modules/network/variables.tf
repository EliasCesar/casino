variable "vpc_app_cidr" { type = string }
variable "vpc_rds_cidr" { type = string }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "vpc_app_name" { type = string }
variable "vpc_rds_name" { type = string }
variable "subnet_private_app_name" { type = string }
variable "subnet_public_app_name" { type = string }
variable "subnet_rds_name" { type = string }

variable "private_rds_subnets" {
	description = "List of private subnet CIDRs for RDS VPC"
	type        = list(string)
}
variable "igw_app_name" { type = string }

variable "availability_zones" {
	description = "List of availability zones to use for subnets"
	type        = list(string)
}

variable "tags" {
	description = "Tags para los recursos de red"
	type        = map(string)
}