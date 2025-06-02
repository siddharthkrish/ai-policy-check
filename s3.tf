# Configure the AWS provider demo
provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name" # TODO: Replace with a unique bucket name
  acl    = "private"

  # Enable versioning (optional)
  versioning {
    enabled = false # Set to true to enable versioning
  }

  # Enable server-side encryption (optional)
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "" # Replace with your KMS key ID (if using)
        encryption_type   = "AES256"
      }
    }
  }

  # Optional tags
  tags = {
    Environment = "Development"
    CreatedBy   = "Terraform"
  }
}

# Optional: Create an S3 bucket policy to grant access (e.g., public read)
# resource "aws_s3_bucket_policy" "public_read" {
#   bucket = aws_s3_bucket.my_bucket.bucket
#   policy = jsonencode({
#     Statement = [
#       {
#         Sid     = "PublicReadPolicy"
#         Effect  = "Allow"
#         Principal = "*"
#         Action   = "s3:GetObject"
#         Resource = "arn:aws:s3:::${aws_s3_bucket.my_bucket.bucket}/*"
#       }
#     ]
#   })
# }
