resource "aws_ecr_repository" "main" {
  name = "${var.project}-${var.environment}"

  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = true

  tags = {
    Name = "${var.project}-${var.environment}-ecr"
  }
}
