module "ec2" {
  source             = "./ec2/"
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnet      = var.public_subnet
  private_subnet     = var.private_subnet
}
module "s3" {
  source = "./s3/"
}