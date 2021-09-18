# ------------------------------------------------------------------------------
# Container Definitions
# ------------------------------------------------------------------------------

locals {
  # Ethereum Indexer API
  api_def = templatefile("${path.module}/templates/container-definition-api.json", {
    CONTAINER_NAME = var.api_container_name
    ESSENTIAL      = var.api_is_essential
    IMAGE_URL      = var.api_image_registry_url
    IMAGE_VERSION  = var.api_image_version
    CONTAINER_PORT = var.api_container_port
    MEMORY         = var.api_container_memory_alloc
    CPU            = var.api_container_cpu_alloc
    CLUSTER_NAME   = local.cluster_name
    AWS_REGION     = var.aws_region
    ENV_VARS = jsonencode(concat(
      [{ name = "PORT", value = tostring(var.api_container_port) }],
      [{ name = "MONGO_URI", value = "${var.mongo_uri}" }],
      [{ name = "WEB3_URI", value = "${var.chain_network_endpoint}" }],
      var.api_environment_vars
    ))
  })

  # Ethereum Indexer Worker
  worker_def = templatefile("${path.module}/templates/container-definition-worker.json", {
    CONTAINER_NAME = var.worker_container_name
    ESSENTIAL      = var.worker_is_essential
    IMAGE_URL      = var.worker_image_registry_url
    IMAGE_VERSION  = var.worker_image_version
    MEMORY         = var.worker_container_memory_alloc
    CPU            = var.worker_container_cpu_alloc
    CLUSTER_NAME   = local.cluster_name
    AWS_REGION     = var.aws_region
    ENV_VARS = jsonencode(concat(
      [{ name = "MONGO_URI", value = "${var.mongo_uri}" }],
      [{ name = "WEB3_URI", value = "${var.chain_network_endpoint}" }],
      var.worker_environment_vars
    ))
  })

  # (Testing with Demo API)
  # api_def = templatefile("${path.module}/templates/container-definition-api.json", {
  #   CONTAINER_NAME = var.api_container_name
  #   ESSENTIAL      = var.api_is_essential
  #   IMAGE_URL      = var.api_image_registry_url
  #   IMAGE_VERSION  = var.api_image_version
  #   CONTAINER_PORT = var.api_container_port
  #   MEMORY         = var.api_container_memory_alloc
  #   CPU            = var.api_container_cpu_alloc
  #   CLUSTER_NAME   = local.cluster_name
  #   AWS_REGION     = var.aws_region
  #   ENV_VARS = jsonencode(concat(
  #     [{ name = "API_PORT", value = tostring(var.api_container_port) }],
  #     [{ name = "MONGO_CONNECT_URI", value = "${var.mongo_uri}" }],
  #     var.api_environment_vars
  #   ))
  # })
}
