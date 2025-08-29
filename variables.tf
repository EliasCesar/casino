# --- Variables para VPCs ---
variable "vpc_app_cidr" {
  description = "CIDR block for application VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_rds_cidr" {
  description = "CIDR block for RDS VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

# --- Variables para RDS ---

variable "rds_cluster_identifier" {
  type    = string
  default = "casino-serverless"
}

variable "rds_engine" {
  type    = string
  default = "aurora-postgresql"
}

variable "rds_engine_version" {
  type    = string
  default = "15.4"
}

variable "rds_master_username" {
  type    = string
  default = "pgadmbd"
}

variable "rds_database_name" {
  type    = string
  default = "casino_db"
}

variable "rds_backup_retention_period" {
  type    = number
  default = 7
}

variable "rds_preferred_backup_window" {
  type    = string
  default = "07:00-09:00"
}

variable "rds_preferred_maintenance_window" {
  type    = string
  default = "sun:05:00-sun:06:00"
}

variable "rds_db_subnet_group_name" {
  type    = string
  default = "casino-rds-subnet-group"
}

variable "rds_storage_encrypted" {
  type    = bool
  default = true
}
variable "rds_deletion_protection" {
  type    = bool
  default = false
}

variable "rds_enable_http_endpoint" {
  type    = bool
  default = false
}

variable "rds_instance_count" {
  type    = number
  default = 2
}

variable "rds_publicly_accessible" {
  type    = bool
  default = false
}

variable "rds_instance_class" {
  type    = string
  default = "db.serverless"
}

variable "rds_engine_mode" {
  type    = string
  default = "provisioned"
}

variable "private_rds_subnets" {
  description = "List of private subnet CIDRs for RDS VPC"
  type        = list(string)
  default     = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets"
  type        = list(string)
  default     = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
}

# --- variables para tags ---
variable "tags" {
  type = object({
    environment     = string
    projectId       = string
    workload        = string
    country         = string
    region          = string
  })
  description = "Tags for the Caino resources."
  default = {
    environment     = "dev"
    projectId       = "promarketing"
    workload        = "casino-online"
    country         = "cl"
    region          = "ca-central-1"
  }
}

# --- Variables para Redis ---
variable "redis_node_type" {
  description = "Instance type for Redis nodes"
  type        = string
  default     = "cache.t3.micro"
}

variable "redis_num_cache_nodes" {
  description = "Number of Redis cache nodes"
  type        = number
  default     = 1
}

variable "redis_parameter_group_name" {
  description = "Parameter group name for Redis"
  type        = string
  default     = "default.redis7"
}

variable "redis_port" {
  description = "Port for Redis access"
  type        = number
  default     = 6379
}
