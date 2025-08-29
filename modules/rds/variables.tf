variable "cluster_identifier" { type = string }
variable "engine" { type = string }
variable "engine_version" { type = string }
variable "master_username" { type = string }
variable "master_password" { type = string }
variable "database_name" { type = string }
variable "backup_retention_period" { type = number }
variable "preferred_backup_window" { type = string }
variable "preferred_maintenance_window" { type = string }
variable "security_group_ids" { type = list(string) }
variable "storage_encrypted" { type = bool }
variable "deletion_protection" { type = bool }
variable "enable_http_endpoint" { type = bool }
variable "instance_count" { type = number }
variable "instance_class" { type = string }
variable "publicly_accessible" { type = bool }
variable "tags" { type = map(string) }
variable "engine_mode" { type    = string }
variable "private_rds_subnets" {  type        = list(string) }
variable "serverlessv2_min_capacity" {
	type    = number
	default = 0.5
	description = "Minimum Aurora Serverless v2 capacity."
}

variable "serverlessv2_max_capacity" {
	type    = number
	default = 2
	description = "Maximum Aurora Serverless v2 capacity."
}
