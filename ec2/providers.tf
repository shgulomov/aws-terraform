provider "aws" {
  region              = var.region
  shared_config_files = ["~/.aws/credentials"]
}