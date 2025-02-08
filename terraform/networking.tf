resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16" # 🔹 Rango de red de la VPC
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}
