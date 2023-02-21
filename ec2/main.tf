# create auto scaling group
resource "aws_autoscaling_group" "asg" {
  name             = var.auto_scaling_group_name
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size

  vpc_zone_identifier = var.private_subnet_ids
  launch_template {
    id      = aws_launch_template.launch_template.id
    version = var.launch_template_version
  }
}
# create security group
resource "aws_security_group" "sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.inbound_port_from
    to_port     = var.inbound_port_to
    protocol    = var.inbound_protocol
    cidr_blocks = var.inbound_cidr_blocks
  }
}
# create launch template
resource "aws_launch_template" "launch_template" {
  name                   = var.launch_template_name
  image_id               = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = var.tags["lt_name"]
  }
}