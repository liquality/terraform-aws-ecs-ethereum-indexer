# ------------------------------------------------------------------------------
# Container Cluster (ECS)
# ------------------------------------------------------------------------------
resource "aws_ecs_cluster" "this" {
  name = local.cluster_name

  setting {
    naname = "containerInsights"
    value  = "enabled"
  }

  tags = local.tags
}
