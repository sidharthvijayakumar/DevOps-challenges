output "security_group_arn" {
  description = "The ARN of the security group"
  value       = try(aws_security_group.this[0].arn, aws_security_group.this_name_prefix[0].arn, "")
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = try(aws_security_group.this[0].id, aws_security_group.this_name_prefix[0].id, "")
}
