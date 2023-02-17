# create s3 bucket
resource "aws_s3_bucket" "tfstate" {
  bucket = var.bucket_name
  acl    = var.acl
  versioning {
    enabled = var.versioning
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }
  tags = {
    Name = var.tags["s3_tag"]
  }
}
# create dynamodb table
resource "aws_dynamodb_table" "tfstate_lock" {
  name         = var.dynamodb_table
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }
  tags = {
    Name = var.tags["dynamodb_tag"]
  }
}