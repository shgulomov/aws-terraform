variable "region" {
  type        = string
  description = "The AWS region to deploy into."
}
variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}
variable "public_subnet" {
  type        = list(any)
  description = "The CIDR block for the public subnet."
}
variable "private_subnet" {
  type        = list(any)
  description = "The CIDR block for the private subnet."
}
variable "availability_zones" {
  type        = list(any)
  description = "The availability zones to deploy into."
}
variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC."
  default     = true
}
variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC."
  default     = true
}
variable "environment" {
  description = "The environment to deploy into."
  default     = "dev"
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
    dynamodb_tag = "DynamoDB Terraform State Lock Table"
    s3_tag       = "S3 Terraform State Bucket"
    lt_name      = "Launch template for EC2 instances"
  }
  description = "Default tags"
}