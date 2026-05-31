output "log_group_name" {
  value = aws_cloudwatch_log_group.app.name
}

output "service_name" {
  value = aws_ecs_service.main.name
}
