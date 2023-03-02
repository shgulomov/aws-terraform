variable "region" {
  type        = string
  description = "The AWS region to deploy into."
  default     = "us-east-1"
}
variable "vpc_cidr" {
  type = string
  description = "The CIDR block for the VPC."
  default = "10.0.0.0/16"
}
variable "public_subnet" {
  type        = list(any)
  description = "The CIDR block for the public subnet."
  default = [ "10.1.0.0/24", "10.2.0.0/24" ]
}
variable "private_subnet" {
  type        = list(any)
  description = "The CIDR block for the private subnet."
  default = [ "10.3.0.0/24", "10.4.0.0/24" ]
}
variable "availability_zones" {
  type        = list(any)
  description = "The availability zones to deploy into."
  default = ["us-east-1a", "us-east-1b"]
  
}
variable "environment" {
  description = "The environment to deploy into."
  default     = "dev"
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

