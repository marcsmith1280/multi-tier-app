output "id" {
  value       = module.vpc.vpc_id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "List of public subnet IDs"
}

output "cidr_block" {
  value       = module.vpc.cidr_block
  description = "The CIDR block associated with the VPC"
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "List of private subnet IDs"
}

output "db_subnet_ids" {
  value       = module.vpc.db_subnet_ids
  description = "List of private subnet IDs"
}