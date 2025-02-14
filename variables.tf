variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "instance_count" {
  description = "Number of application instances"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "Instance type for application and MongoDB"
  type        = string
  default     = "t3.medium"
}