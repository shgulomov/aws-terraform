variable "region" {
  type        = string
  description = "The AWS region to deploy into."
}
variable "vpc_cidr" {
  type = string
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

