module "vpc" {
  source               = "./network/"
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet        = var.public_subnet
  private_subnet       = var.private_subnet
  environment          = var.environment
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}
module "ec2" {
  source                     = "./ec2/"
  vpc_id                     = module.vpc.cloud_vpc.vpc_id
  private_subnet_ids         = module.vpc.cloud_vpc.private_subnet

  region                     = var.region
  vpc_cidr                   = var.vpc_cidr
  auto_scaling_group_name    = var.auto_scaling_group_name
  desired_capacity           = var.desired_capacity
  max_size                   = var.max_size
  min_size                   = var.min_size
  launch_template_version    = var.launch_template_version
  launch_configuration_name  = var.launch_configuration_name
  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description
  inbound_port_from          = var.inbound_port_from
  inbound_port_to            = var.inbound_port_to
  inbound_protocol           = var.inbound_protocol
  inbound_cidr_blocks        = var.inbound_cidr_blocks
  launch_template_name       = var.launch_template_name
  ami_id                     = var.ami_id
  instance_type              = var.instance_type
  key_name                   = var.key_name
  tags                       = var.tags
}

module "s3" {
  source         = "./s3/"
  region         = var.region
  bucket_name    = var.bucket_name
  acl            = var.acl
  versioning     = var.versioning
  sse_algorithm  = var.sse_algorithm
  dynamodb_table = var.dynamodb_table
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  hash_key_type  = var.hash_key_type
  tags           = var.tags
}