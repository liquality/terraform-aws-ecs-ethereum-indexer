# ------------------------------------------------------------------------------
# Container Registries (ECR)
# TODO: Remove this - We will eventually pull from a GitHub registry !!!
# ------------------------------------------------------------------------------

# --------------------------------------------------------- Ethereum Indexer API
resource "aws_ecr_repository" "api" {
  name = var.api_container_name
  # image_tag_mutability = "IMMUTABLE"

  tags = local.tags
}

resource "aws_ecr_repository_policy" "api_policy" {
  repository = aws_ecr_repository.api.name

  policy = templatefile("${path.module}/templates/ecr-policy.json", {
    CONTAINER_NAME = var.api_container_name
    ACCT_ID_MAIN   = var.account_id_main
  })
}

# ------------------------------------------------------ Ethereum Indexer Worker
resource "aws_ecr_repository" "worker" {
  name = var.worker_container_name
  # image_tag_mutability = "IMMUTABLE"

  tags = local.tags
}

resource "aws_ecr_repository_policy" "worker_policy" {
  repository = aws_ecr_repository.worker.name

  policy = templatefile("${path.module}/templates/ecr-policy.json", {
    CONTAINER_NAME = var.worker_container_name
    ACCT_ID_MAIN   = var.account_id_main
  })
}
