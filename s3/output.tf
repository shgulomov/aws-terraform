output "s3_bucket" {
  value = {
    bucket_id = aws_s3_bucket.tfstate.id
  }
}
output "s3_bucket_arn" {
  value = {
    bucket_arn = aws_s3_bucket.tfstate.arn
  }
}
output "dynamodb_table" {
  value = {
    dynamodb_table = aws_dynamodb_table.tfstate_lock.id
  }
}
output "dynamodb_table_arn" {
  value = {
    dynamodb_table_arn = aws_dynamodb_table.tfstate_lock.arn
  }
}
