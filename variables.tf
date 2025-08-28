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
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

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