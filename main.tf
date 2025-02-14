terraform {  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.region
  profile = "default"
  shared_credentials_files = ["~/.aws/credentials"]
}

module "vpc" {
  source              = "./modules/VPC"
  public_subnets_cidr = var.public_subnets_cidr
  cidr_block          = var.cidr_block
}

module "security_groups" {
  source = "./modules/SG"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/EC2"
  instance_count    = var.instance_count
  ami_id            = "ami-04b4f1a9cf54c11d0"
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.security_groups.ec2_sg_id
}

resource "aws_iam_role" "gitlab_role" {
  name = "gitlab-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "gitlab_policy" {
  name        = "gitlab-policy"
  description = "Policy for GitLab to access AWS resources"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ec2:*",
          "s3:*",
          "iam:*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "gitlab_policy_attachment" {
  role       = aws_iam_role.gitlab_role.name
  policy_arn = aws_iam_policy.gitlab_policy.arn
}
