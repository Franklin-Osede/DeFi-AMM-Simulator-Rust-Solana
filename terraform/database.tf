resource "aws_db_instance" "postgres" {
  identifier             = "amm-postgres-db"
  engine                 = "postgres"
  engine_version         = "15.3"
  instance_class         = "db.t3.micro" # 🔹 Free-tier eligible for initial testing
  allocated_storage      = 20
  storage_encrypted      = true
  publicly_accessible    = false
  db_name                = "ammsimulator"
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.postgres15"
  skip_final_snapshot    = true # 🔹 Prevents Terraform from blocking destroy
  vpc_security_group_ids = [aws_security_group.db_sg.id]
}

resource "aws_security_group" "db_sg" {
  name        = "db-security-group"
  description = "Allow PostgreSQL access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # 🔹 Restrict access within VPC
  }
}
