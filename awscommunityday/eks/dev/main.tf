
#############################################
# General Configuration
#############################################

provider "aws" {
  version = ">= 2.28.1"
  region  = var.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "${var.env}-awscommunity"
  app          = "demo"
}

#############################################
# VPC
#############################################

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = "${var.env}-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}

#############################################
# Cluster EKS
#############################################

module "eks" {
  source = "../modules/eks"

  cluster_name                        = local.cluster_name
  subnets                             = module.vpc.private_subnets
  vpc_id                              = module.vpc.vpc_id
  additional_userdata                 = "echo Welcome AWS Community Day"
  instance_type                       = "t2.medium"
  key_name                            = "ops"
  worker_group_a_asg_desired_capacity = 1
  worker_group_b_asg_desired_capacity = 1
  worker_a_cidr_blocks                = "10.0.0.0/8"
  worker_b_cidr_blocks                = "10.0.0.0/8"
  all_cidr_blocks = [
    "10.0.0.0/8",
    "192.168.0.0/16",
  ]
  create_eks      = true
  manage_aws_auth = false

}
