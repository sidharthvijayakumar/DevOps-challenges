variable "policy_create" {
  description = "Whether to create the IAM policy"
  type        = bool
  default     = true
}

variable "policy_name" {
  description = "The name of the policy"
  type        = string
  default     = null
}

variable "policy_name_prefix" {
  description = "IAM policy name prefix"
  type        = string
  default     = null
}

variable "path" {
  description = "The path of the policy in IAM"
  type        = string
  default     = null
}

variable "policy_description" {
  description = "The description of the policy"
  type        = string
  default     = null
}

variable "policy" {
  description = "The path of the policy in IAM (tpl file)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
} 