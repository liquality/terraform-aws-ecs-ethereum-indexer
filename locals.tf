locals {
  cluster_name        = "chain-indexer-${var.chain_network_name}"
  api_service_name    = "indexer-api-${var.chain_network_name}"
  worker_service_name = "indexer-worker-${var.chain_network_name}"
  api_task_name       = "${var.api_task_name}-${var.chain_network_name}"
  worker_task_name    = "${var.worker_task_name}-${var.chain_network_name}"
  mongo_uri           = "mongodb://${var.mongo_db_user}:${var.mongo_db_password}@${var.mongo_db_host}:27017/${var.mongo_db_name}?authSource=admin"
  route53_record_name = "${var.route53_record_name_prefix}${var.chain_network_name}"
  vpc_workspace_name  = "aws-networking-infra-${var.env_alias}"
}

locals {
  tags = {
    environment   = var.env_alias
    chain_service = "chain-indexer"
    chain_network = var.chain_network_name
  }
}
