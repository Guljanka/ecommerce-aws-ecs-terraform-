output "cluster_endpoint" {
  value = aws_rds_cluster.main.endpoint
}

output "cluster_reader_endpoint" {
  value = aws_rds_cluster.main.reader_endpoint
}

output "cluster_id" {
  value = aws_rds_cluster.main.id
}

output "cluster_arn" {
  value = aws_rds_cluster.main.arn
}

output "master_user_secret_arn" {
  value = aws_rds_cluster.main.master_user_secret[0].secret_arn
}
