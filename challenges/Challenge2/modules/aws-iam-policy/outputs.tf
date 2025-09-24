################################################################################
# IAM Policy
################################################################################

output "policy_id" {
  description = "The policy's ID"
  value       = try(aws_iam_policy.policy[0].id, null)
}

output "policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = try(aws_iam_policy.policy[0].arn, null)
}

output "policy_name" {
  description = "The name of the policy"
  value       = try(aws_iam_policy.policy[0].name, null)
}

output "policy" {
  description = "The policy document"
  value       = try(aws_iam_policy.policy[0].policy, null)
}