resource "aws_ecs_cluster" "main" {
  name = "${var.project}-${var.environment}-cluster"

  tags = {
    Name = "${var.project}-${var.environment}-cluster"
  }
}
