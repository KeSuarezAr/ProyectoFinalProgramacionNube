variable "instance_count" {
  description = "CIDR block for the VPC"
  type        = number
}

variable "ami_id" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "subnet_id" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "security_group_id" {
  description = "CIDR block for the VPC"
  type        = string
}