variable "region" {
  type        = string
  description = "The AWS region to deploy into."
}
variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket to store the Terraform state file."
  default     = "tfstate-cloud-s3"
}
variable "versioning" {
  type        = bool
  description = "Enable versioning on the S3 bucket."
  default     = true
}
variable "dynamodb_table" {
  type        = string
  description = "The name of the DynamoDB table to use for locking."
  default     = "cloud-terraform-lock"
}
variable "acl" {
  type        = string
  description = "The canned ACL to apply."
  default     = "private"
}
variable "sse_algorithm" {
  type        = string
  description = "The server-side encryption algorithm to use."
  default     = "AES256"
}
variable "billing_mode" {
  type        = string
  description = "Controls how you are charged for read and write throughput and how you manage capacity."
  default     = "PAY_PER_REQUEST"
}
variable "hash_key" {
  type        = string
  description = "The name of the hash key."
  default     = "LockID"
}
variable "hash_key_type" {
  type        = string
  description = "The type of the hash key."
  default     = "S"
}
variable "tags" {
  type = map(any)
  default = {
    dynamodb_tag = "DynamoDB Terraform State Lock Table"
    s3_tag       = "S3 Terraform State Bucket"
  }
  description = "Default tags"
}

