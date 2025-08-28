variable "vpc_app_cidr" { type = string }
variable "vpc_rds_cidr" { type = string }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "vpc_app_name" { type = string }
variable "vpc_rds_name" { type = string }

variable "tags" {
	description = "Tags para los recursos de red"
	type        = map(string)
}