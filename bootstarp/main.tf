# Define the S3 Bucket resource
resource "aws_s3_bucket" "tf_state" {
  bucket = "bijesh-s3-bucket" # The name must be globally unique across all of AWS
  
  tags = {
    Name        = "My Terraform Bucket"
    Environment = "Dev"
    
  }
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    
    status = "Enabled"
  }
}

# Enable encryption - securing s3 buck
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# DynamoDB table for Terraform state locking
resource "aws_dynamodb_table" "tf_locks" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "Dev"
  }
}