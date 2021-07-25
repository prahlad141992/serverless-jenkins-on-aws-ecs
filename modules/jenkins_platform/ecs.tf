// Jenkins Container Infra (Fargate)
resource "aws_ecs_cluster" jenkins_controller {
  name               = "${var.name_prefix}-main"
  capacity_providers = ["FARGATE"]
  tags               = var.tags
  setting {
    name = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster" jenkins_agents {
  name               = "${var.name_prefix}-spot"
  capacity_providers = ["FARGATE_SPOT"]
  tags               = var.tags
  setting {
    name = "containerInsights"
    value = "enabled"
  }
}