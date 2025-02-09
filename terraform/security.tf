resource "aws_security_group" "db_sg" {
  name        = "database-security-group"
  description = "Security group for PostgreSQL database"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # ✅ Restricción a la VPC privada
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # ✅ Permite tráfico de salida a cualquier destino
  }

  tags = {
    Name = "db-security-group"
  }
}
