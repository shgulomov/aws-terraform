# create s3 bucket
resource "aws_s3_bucket" "tfstate" {
  bucket = "tfstate-cloud-s3"
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}
# create dynamodb table
resource "aws_dynamodb_table" "tfstate_lock" {
  name         = "cloud-terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}