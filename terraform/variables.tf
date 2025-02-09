variable "aws_region" {
  description = "Region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "default"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "db_username" {
  description = "The username for the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "The instance type of the RDS database"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the PostgreSQL database"
  type        = string
  default     = "ammsimulator"
}

variable "s3_bucket_name" {
  description = "S3 bucket name to store Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
}
