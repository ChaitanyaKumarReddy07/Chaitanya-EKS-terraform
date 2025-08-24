variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-southeast-2"
}

variable "env" {
  type        = string
  description = "Environment (e.g., dev, prod)"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "igw_name" {
  type        = string
  description = "Internet Gateway name"
}

variable "pub_subnet_count" {
  type        = number
  description = "Number of public subnets"
}

variable "pub_cidr_block" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "pub_availability_zone" {
  type        = list(string)
  description = "List of availability zones for public subnets"
}

variable "pub_sub_name" {
  type        = string
  description = "Prefix/name for public subnets"
}

variable "pri_subnet_count" {
  type        = number
  description = "Number of private subnets"
}

variable "pri_cidr_block" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "pri_availability_zone" {
  type        = list(string)
  description = "List of availability zones for private subnets"
}

variable "pri_sub_name" {
  type        = string
  description = "Prefix/name for private subnets"
}

variable "public_rt_name" {
  type        = string
  description = "Public route table name"
}

variable "private_rt_name" {
  type        = string
  description = "Private route table name"
}

variable "eip_name" {
  type        = string
  description = "Elastic IP name"
}

variable "ngw_name" {
  type        = string
  description = "NAT Gateway name"
}

variable "eks_sg" {
  type        = string
  description = "EKS security group ID"
}

# EKS related variables
variable "is_eks_cluster_enabled" {
  type        = bool
  description = "Flag to enable/disable EKS cluster"
  default     = true
}

variable "cluster_version" {
  type        = string
  description = "EKS cluster version (e.g., 1.33)"
}

variable "endpoint_private_access" {
  type        = bool
  description = "Enable private endpoint access"
  default     = false
}

variable "endpoint_public_access" {
  type        = bool
  description = "Enable public endpoint access"
  default     = true
}

variable "ondemand_instance_types" {
  type        = list(string)
  description = "List of on-demand EC2 instance types"
  default     = ["t3a.medium"]
}

variable "spot_instance_types" {
  type        = list(string)
  description = "List of spot EC2 instance types"
  default     = []
}

variable "desired_capacity_on_demand" {
  type        = number
  description = "Desired on-demand capacity"
}

variable "min_capacity_on_demand" {
  type        = number
  description = "Minimum on-demand capacity"
}

variable "max_capacity_on_demand" {
  type        = number
  description = "Maximum on-demand capacity"
}

variable "desired_capacity_spot" {
  type        = number
  description = "Desired spot capacity"
}

variable "min_capacity_spot" {
  type        = number
  description = "Minimum spot capacity"
}

variable "max_capacity_spot" {
  type        = number
  description = "Maximum spot capacity"
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))
  description = "EKS addons to install"
  default     = []
}
