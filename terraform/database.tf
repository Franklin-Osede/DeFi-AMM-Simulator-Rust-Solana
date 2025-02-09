# Grupo de Subnet para la Base de Datos
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "Database Subnet Group"
  }
}

# Base de Datos PostgreSQL
resource "aws_db_instance" "postgres" {
  identifier           = "amm-postgres-db"
  engine               = "postgres"
  engine_version       = "15.9"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_encrypted    = true
  publicly_accessible  = false
  db_name              = "ammsimulator"
  username             = "dbuser"
  password             = var.db_password
  parameter_group_name = "default.postgres15"
  skip_final_snapshot  = true

  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name # ✅ La base de datos usa la misma VPC
  vpc_security_group_ids = [aws_security_group.db_sg.id]            # ✅ El Security Group correcto

  tags = {
    Name = "postgres-db"
  }
}
