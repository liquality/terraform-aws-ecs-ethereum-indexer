# ------------------------------------------------------------------------------
# Chain settings
# ------------------------------------------------------------------------------
variable "chain_id" {
  type        = string
  description = "The identifier for the ethereum-based chain (e.g eth, rsk, bsc)."
}

variable "chain_network_name" {
  type        = string
  description = "The name of the chain network (e.g ropsten, rinkeby, mainnet)."
}

variable "chain_network_endpoint" {
  type        = string
  description = "The web3 uri for the Ethereum blockchain network."
}

# ------------------------------------------------------------------------------
# Data store
# ------------------------------------------------------------------------------
variable "mongo_uri" {
  type        = string
  description = "The connection uri for the MongoDB database."
}
