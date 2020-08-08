variable "cluster_name" {
  type = string
}

variable "subnets" {
  type = list
}

variable "vpc_id" {
  type = string
}

variable "additional_userdata" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = "t2.small"
}

variable "worker_group_a_asg_desired_capacity" {
  type    = string
  default = 1
}

variable "worker_group_b_asg_desired_capacity" {
  type    = string
  default = 1
}

variable "worker_a_cidr_blocks" {
  type = string
}

variable "worker_b_cidr_blocks" {
  type = string
}

variable "all_cidr_blocks" {
  type = list
}

variable "key_name" {
  type    = string
  default = "ops"
}

variable "manage_aws_auth" {
  type        = bool
  default     = true
}

variable "create_eks" {
  type        = bool
  default     = true
}

variable "version_eks" {
  type = string
  default = "1.15"
}

variable "ami_id" {
  type = string
  default = "ami-0842e3f57a7f2db2e"
}