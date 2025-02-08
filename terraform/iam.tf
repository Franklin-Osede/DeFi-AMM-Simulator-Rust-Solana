# 🔹 IAM Policy to allow Terraform to manage S3 state storage
resource "aws_iam_policy" "terraform_s3_policy" {
  name        = "TerraformS3Policy"
  description = "Allow Terraform to manage S3 for state storage"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:CreateBucket",
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucketMultipartUploads",
          "s3:AbortMultipartUpload"
        ]
        Resource = [
          "arn:aws:s3:::terraform-state-frank",
          "arn:aws:s3:::terraform-state-frank/*"
        ]
      }
    ]
  })
}

# 🔹 IAM Policy to allow Terraform to manage VPC
resource "aws_iam_policy" "terraform_vpc_policy" {
  name        = "TerraformVPCPolicy"
  description = "Allow Terraform to manage VPC resources"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateVpc",
          "ec2:DescribeVpcs",
          "ec2:DeleteVpc",
          "ec2:CreateSubnet",
          "ec2:DeleteSubnet",
          "ec2:DescribeSubnets",
          "ec2:ModifyVpcAttribute",
          "ec2:AssociateDhcpOptions",
          "ec2:CreateSecurityGroup",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupEgress"
        ]
        Resource = "*"
      }
    ]
  })
}

# 🔹 Attach S3 Policy to the existing IAM user
resource "aws_iam_user_policy_attachment" "terraform_s3_attach" {
  user       = "terraform-deployer" # ✅ Use the existing user
  policy_arn = aws_iam_policy.terraform_s3_policy.arn
}

# 🔹 Attach VPC Policy to the existing IAM user
resource "aws_iam_user_policy_attachment" "terraform_vpc_attach" {
  user       = "terraform-deployer" # ✅ Use the existing user
  policy_arn = aws_iam_policy.terraform_vpc_policy.arn
}
