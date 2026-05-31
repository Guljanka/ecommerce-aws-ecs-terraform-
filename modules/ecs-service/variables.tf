variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "cluster_id" {
  type = string
}

variable "service_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "target_group_arn" {
  description = "ALB Target Group ARN"
  type        = string
}

variable "redis_endpoint" {
  type = string
}

variable "aurora_cluster_endpoint" {
  type = string
}

variable "db_password_secret_arn" {
  type = string
}
