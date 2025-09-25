################################################################################
# IAM Policy
################################################################################

resource "aws_iam_policy" "policy" {
  count = var.policy_create ? 1 : 0

  description = var.policy_description
  name        = var.policy_name
  name_prefix = var.policy_name_prefix
  path        = var.path
  policy      = var.policy

  tags = var.tags
}