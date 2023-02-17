variable "region" {
  type        = string
  description = "The AWS region to deploy into."
}
variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}
variable "vpc_id" {
  type        = string
  description = "The VPC ID."
}
variable "private_subnet" {
  type        = list(any)
  description = "The CIDR block for the private subnet."
}
variable "environment" {
  description = "The environment to deploy into."
  default     = "dev"
}
variable "instance_type" {
  type        = string
  description = "The instance type to deploy."
  default     = "t2.micro"
}
variable "ami_id" {
  type        = string
  description = "The AMI to deploy."
  default     = "ami-0c2b8ca1dad447f8a"
}
variable "key_name" {
  type        = string
  description = "The key name to deploy."
  default     = "my-key"
}
variable "instance_name" {
  type        = string
  description = "The name of the EC2 instance."
  default     = "terraform-ec2-instance"
}
variable "user_data" {
  type        = string
  description = "The user data to deploy."
  default     = "echo 'Hello, World!' > index.html"
}
variable "security_group_name" {
  type        = string
  description = "The name of the security group."
  default     = "terraform-ec2-sg"
}
variable "security_group_description" {
  type        = string
  description = "The description of the security group."
  default     = "Security group for the EC2 instance."
}
variable "auto_scaling_group_name" {
  type        = string
  description = "The name of the auto scaling group."
}
variable "launch_configuration_name" {
  type        = string
  description = "The name of the launch configuration."
}
variable "desired_capacity" {
  type        = number
  description = "The desired capacity of the auto scaling group."
  default     = 1
}
variable "max_size" {
  type        = number
  description = "The maximum size of the auto scaling group."
  default     = 1
}
variable "min_size" {
  type        = number
  description = "The minimum size of the auto scaling group."
  default     = 1
}
variable "launch_template_version" {
  type        = string
  description = "The version of the launch template."
  default     = "$Latest"
}
variable "launch_template_name" {
  type        = string
  description = "The name of the launch template."
  default     = "terraform-ec2-lt"
}
variable "inbound_port_from" {
  type        = number
  description = "The port to allow inbound traffic from."
  default     = 22
}
variable "inbound_port_to" {
  type        = number
  description = "The port to allow inbound traffic to."
  default     = 22
}
variable "inbound_protocol" {
  type        = string
  description = "The protocol to allow inbound traffic."
  default     = "tcp"
}
variable "inbound_cidr_blocks" {
  type        = list(any)
  description = "The CIDR blocks to allow inbound traffic from."
  default     = ["0.0.0.0/0"]
}
variable "tags" {
  type = map(any)
  default = {
    lt_name = "terraform-ec2-lt"
  }
  description = "Default tags"
}
