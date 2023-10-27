# Common Variables

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}

variable "region" {
  type        = string
  description = "Region of the VPC"
}

# VPC Variables

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

# Subnet Variables

variable "public_subnet_cidr_blocks" {
  type        = list(any)
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  type        = list(any)
  description = "List of private subnet CIDR blocks"
}

variable "db_subnet_cidr_blocks" {
  type        = list(any)
  description = "List of DB subnet CIDR blocks"
}

variable "availability_zones" {
  type        = list(any)
  description = "List of availability zones"
}

variable "create_nat_gateway" {
  type        = bool
  description = "whether to create a NAT gateway or not"
}

variable "owner" {
  type        = string
  description = "Name of owner"
}

variable "environment" {
  type        = string
  description = "The environment name for the resources."
}


variable "application" {
  type        = string
  description = "Name of the application"
}

variable "cost_center" {
  type        = string
  description = "Name of cost-center for this alb-asg"
}

variable "instance_tenancy" {
  type        = string
  description = "Set instance-tenancy"
}

variable "enable_dns_support" {
  type        = bool
  description = "whether to enable DNS support or not"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "whether to enable DNS hostnames or not"
}

variable "domain" {
  type        = string
  description = "Set the domain of eip"
}

variable "destination_cidr_block" {
  type        = string
  description = "Set the destination cidr block"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "whether to map public ip on launch or not"
}