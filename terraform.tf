terraform {
  backend "s3" {
    bucket               = "tfstate-cloud-s3"
    region               = "us-east-1"
    key                  = "terraform.tfstate"
    dynamodb_table       = "cloud-terraform-lock"
  }
}