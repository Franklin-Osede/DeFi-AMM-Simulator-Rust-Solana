# 🔹 Create an IAM user for Terraform
resource "aws_iam_user" "terraform_user" {
  name          = "terraform-deployer"
  path          = "/"
  force_destroy = true
}

# 🔹 Generate secure access keys for the IAM user
resource "aws_iam_access_key" "terraform_access_key" {
  user = aws_iam_user.terraform_user.name
}

# 🔹 Attach a policy with controlled permissions for Terraform
resource "aws_iam_policy_attachment" "terraform_policy_attach" {
  name       = "TerraformFullAccess"
  users      = [aws_iam_user.terraform_user.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess" # ⚠️ Reduce permissions if needed
}

# 🔹 Improved outputs with useful information
output "terraform_iam_user" {
  description = "IAM User created for Terraform"
  value       = aws_iam_user.terraform_user.name
}

output "iam_access_key" {
  description = "Access Key for the Terraform IAM User"
  value       = aws_iam_access_key.terraform_access_key.id
  sensitive   = true # Protects the key from being exposed in logs
}

output "iam_secret_key" {
  description = "Secret Key for the Terraform IAM User"
  value       = aws_iam_access_key.terraform_access_key.secret
  sensitive   = true # Prevents displaying the secret in Terraform output
}
