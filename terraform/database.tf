resource "aws_db_instance" "postgres" {
  identifier             = "amm-postgres-db"
  engine                 = "postgres"
  engine_version         = "15.9"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_encrypted      = true
  publicly_accessible    = false
  db_name                = "ammsimulator"
  username               = "dbuser" # por otro nombre
  password               = var.db_password
  parameter_group_name   = "default.postgres15"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
}
