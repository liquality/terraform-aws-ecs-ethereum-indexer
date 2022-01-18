# ------------------------------------------------------------------------------
# Chain settings
# ------------------------------------------------------------------------------
variable "chain_network_name" {
  type        = string
  description = "A logical name for the chain network (e.g eth-ropsten, eth-rinkeby, rsk-mainnet)."
}

variable "chain_network_endpoint" {
  type        = string
  description = "The web3 uri for the blockchain network."
}

# ------------------------------------------------------------------------------
# Data store
# ------------------------------------------------------------------------------
variable "mongo_db_name" {
  type        = string
  description = "The name of the MongoDB database to use."
}

variable "mongo_db_host" {
  type        = string
  description = "The host for the MongoDB database."
}

variable "mongo_db_user" {
  type        = string
  description = "The user for the MongoDB database."
}

variable "mongo_db_password" {
  type        = string
  description = "The password for the MongoDB database."
}

# ------------------------------------------------------------------------------
# SSL/TLS settings
# ------------------------------------------------------------------------------
variable "use_https" {
  type        = bool
  description = "Set to true to enable HTTPS on the front-end (load balancer) traffic."
  default     = false
}

variable "https_certificate_arn" {
  type        = string
  description = "The ARN for the SSL/TLS certificate (required if use_https is set to true)."
  default     = ""
}
