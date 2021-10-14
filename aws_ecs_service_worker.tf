# ------------------------------------------------------------------------------
# ECS Service - Ethereum Indexer Worker
# ------------------------------------------------------------------------------
resource "aws_ecs_service" "worker" {
  name            = local.worker_service_name
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.worker.arn
  launch_type     = "FARGATE"

  desired_count = var.worker_instance_count

  network_configuration {
    subnets = [data.terraform_remote_state.vpc.outputs.private_subnets[0]] # us-east-1a (NAT Gateway is here)
    security_groups = [
      data.terraform_remote_state.vpc.outputs.sg_http_80_id,  # port 80
      data.terraform_remote_state.vpc.outputs.sg_https_443_id # port 443
    ]
    assign_public_ip = false
  }

  tags = local.tags
}

# ------------------------------------------------------------------------------
# Task Definition
# ------------------------------------------------------------------------------
resource "aws_ecs_task_definition" "worker" {
  family = local.worker_service_name

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn

  memory = var.worker_container_memory_alloc
  cpu    = var.worker_container_cpu_alloc

  tags = local.tags

  container_definitions = format("[%s]", join(",", [
    "${local.worker_def}"
  ]))
}
