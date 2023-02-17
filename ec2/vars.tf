variable "region" {
  description = "The AWS region to deploy into"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "172.1.0.0/16"
}

variable "public_subnet" {
  type        = list(any)
  description = "The CIDR block for the public subnet"
  default     = ["172.1.1.0/24", "172.1.2.0/24"]
}
variable "private_subnet" {
  type        = list(any)
  description = "The CIDR block for the private subnet"
  default     = ["172.1.3.0/24", "172.1.4.0/24"]
}
variable "availability_zones" {
  type        = list(any)
  description = "The availability zones to deploy into"
  default     = ["us-east-1a", "us-east-1b"]
}