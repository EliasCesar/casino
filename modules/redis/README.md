# Redis Module

This module provisions an AWS ElastiCache Redis cluster in the RDS VPC using provided subnets and security groups.

## Inputs
- subnet_group_name
- subnet_ids
- cluster_id
- node_type
- num_cache_nodes
- parameter_group_name
- port
- security_group_ids
- tags

## Outputs
- redis_cluster_id
- redis_endpoint
- redis_port
- redis_subnet_group_name
