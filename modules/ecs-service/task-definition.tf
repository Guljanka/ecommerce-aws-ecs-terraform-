resource "aws_ecs_task_definition" "app" {
  family                   = "${var.project}-${var.environment}-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name      = "app"
      image     = "851771533724.dkr.ecr.us-east-1.amazonaws.com/ecommerce-production:v4"
      essential = true

      environment = [
      {
       name  = "REDIS_HOST"
       value = var.redis_endpoint
      },
     {
       name  = "REDIS_PORT"
       value = "6379"
      },
     {
      name  = "DB_HOST"
      value = var.aurora_cluster_endpoint
      }
     ]
     
        secrets = [
     {
        name      = "DB_PASSWORD"
        valueFrom = var.db_password_secret_arn
      }
     ]

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.app.name
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

resource "aws_iam_role" "ecs_task_execution" {
  name = "${var.project}-${var.environment}-ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy" "ecs_secrets_read" {
  name = "${var.project}-${var.environment}-ecs-secrets-read"
  role = aws_iam_role.ecs_task_execution.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = "*"
      }
    ]
  })
}
