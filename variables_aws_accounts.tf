# ------------------------------------------------------------------------------
# Account IDs for access to ECR
# TODO: This will be removed when we move away from ECR !!!
# ------------------------------------------------------------------------------
variable "account_id_main" {
  type        = string
  description = "The main (management) account ID to permit access to ECR."
  default     = "183887234524"
}
