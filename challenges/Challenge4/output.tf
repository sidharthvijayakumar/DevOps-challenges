output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(module.vpc.default_vpc_id, null)
}
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.security-group.security_group_id
}