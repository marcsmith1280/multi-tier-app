output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}

output "cidr_block" {
  value       = var.vpc_cidr_block
  description = "The CIDR block associated with the VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
  description = "List of private subnet IDs"
}

output "db_subnet_ids" {
  value       = aws_subnet.db.*.id
  description = "List of private subnet IDs"
}