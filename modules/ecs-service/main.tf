resource "aws_cloudwatch_log_group" "app" {
  name              = "/ecs/${var.project}-${var.environment}"
  retention_in_days = 30

  tags = {
    Name = "${var.project}-${var.environment}-ecs-logs"
  }
}

resource "aws_ecs_service" "main" {
  name            = var.service_name
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1

  launch_type = "FARGATE"

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "app"
    container_port   = 80
  }

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [var.security_group_id]
    assign_public_ip = false
  }
}
