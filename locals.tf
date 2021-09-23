locals {
  cluster_name        = "chain-services-${var.chain_id}-${var.chain_network_name}"
  api_service_name    = "${var.chain_id}-${var.chain_network_name}-indexer-api"
  worker_service_name = "${var.chain_id}-${var.chain_network_name}-indexer-worker"
  mongo_uri           = "mongodb://${var.mongo_db_user}:${var.mongo_db_password}@${var.mongo_db_host}:27017/${var.mongo_db_name}?authSource=admin"
  vpc_workspace_name  = "aws-networking-infra-${var.env_alias}"
}

locals {
  tags = {
    environment   = var.env_alias
    chain_service = "ethereum-indexer"
    chain_id      = var.chain_id
    chain_network = var.chain_network_name
  }
}
