generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    backend "s3" {
    bucket         = "tfstate-cloud-s3"
    region         = "us-east-1"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "cloud-terraform-lock"
    encrypt        = true
  }
}
EOF
}