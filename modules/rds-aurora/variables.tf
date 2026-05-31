variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_data_subnet_ids" {
  type = list(string)
}

variable "database_name" {
  type    = string
  default = "ecommerce"
}

variable "master_username" {
  type    = string
  default = "adminuser"
}

variable "rds_security_group_id" {
  type = string
}
