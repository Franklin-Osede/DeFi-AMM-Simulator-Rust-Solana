terraform {
  backend "s3" {
    bucket         = "terraform-state-frank"    # 🔹 Unique S3 bucket for Terraform state
    key            = "global/terraform.tfstate" # 🔹 Path to the state file in S3
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks" # 🔹 For state locking to prevent corruption
  }
}
