resource "aws_db_subnet_group" "main" {
  name       = "${var.project}-${var.environment}-aurora-subnet-group"
  subnet_ids = var.private_data_subnet_ids

  tags = {
    Name = "${var.project}-${var.environment}-aurora-subnet-group"
  }
}

resource "aws_rds_cluster" "main" {
  cluster_identifier = "${var.project}-${var.environment}-aurora"

  engine         = "aurora-mysql"
  engine_version = "8.0.mysql_aurora.3.04.0"

  database_name   = var.database_name
  master_username = var.master_username

  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_security_group_id]

  backup_retention_period = 7
  skip_final_snapshot     = true
  deletion_protection     = false

  storage_encrypted = true

  tags = {
    Name = "${var.project}-${var.environment}-aurora"
  }
}

resource "aws_rds_cluster_instance" "writer" {
  identifier         = "${var.project}-${var.environment}-aurora-writer"
  cluster_identifier = aws_rds_cluster.main.id

  instance_class = "db.t4g.medium"

  engine         = aws_rds_cluster.main.engine
  engine_version = aws_rds_cluster.main.engine_version

  publicly_accessible = false

  tags = {
    Name = "${var.project}-${var.environment}-aurora-writer"
  }
}
