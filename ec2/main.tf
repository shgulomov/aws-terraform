module "vpc" {
  source             = "../networking/"
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnet      = var.public_subnet
  private_subnet     = var.private_subnet
}
# create auto scaling group
resource "aws_autoscaling_group" "asg" {
  name             = "cloud_asg"
  desired_capacity = 2
  max_size         = 3
  min_size         = 1

  vpc_zone_identifier = module.vpc.cloud_vpc.private_subnet
  launch_template {
    id      =  aws_launch_template.launch_template.id
    version = "$Latest"
  }
}
# create security group
resource "aws_security_group" "sg" {
  name        = "cloud_sg"
  description = "Security group for asg"
  vpc_id      = module.vpc.cloud_vpc.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# create launch template
resource "aws_launch_template" "launch_template" {
  name                   = "cloud_launch_template"
  image_id               = "ami-0dfcb1ef8550277af"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "launch_template"
  }
}