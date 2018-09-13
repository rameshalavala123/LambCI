// Variables that can be overriden on the command line, or in .tfvars files.

variable "aws_region" {
  default     = "eu-west-1"
  description = "The AWS Region to build the VPC in.  Only one region is supported right now."
}

variable "availability_zones" {
  default     = ["eu-west-1a", "eu-west-1b"]
  description = "The availability zones the we should create subnets in, launch instances in, and configure for ELB and ASG"
}

variable "vpc_cidr" {
  default     = "10.50.0.0/16"
  description = "The range of IP addresses that we use in this VPC"
}

variable "public_subnet_cidr" {
  default     = ["10.50.1.0/24"]
  description = "CIDR blocks for public subnets. Number of entries must match 'availability_zones'."
}

variable "private_subnet_cidr" {
  default     = ["10.50.0.128/24"]
  description = "CIDR blocks for private subnets. Number of entries must match 'availability_zones'."
}

variable "product" {
  default     = "Sogeti-PostNL-Test"
  description = "name of the product resource belongs to."
}

variable "env" {
  default     = "t"
  description = "Environment resource belongs to. Value of this tag is used inside Chef configuration to fetch required config"
}

variable "environment" {
  default     = "test"
  description = "Environment resource belongs to. Value of this tag is used inside Chef configuration to fetch required config"
}

variable "ZONE" {
  default     = "W"
  description = "ZONE it belongs to as Management/Workspace.."
}

variable "cost_center" {
  default     = "GENERIC_UNSPECIFIED"
  description = "Cost Center"
}

variable "owner" {
  description = "This should be an email of a person or a group that is responsible for the resource."
}

variable "type" {
  description = "Type of VPC. Use either 'central' or 'island'. 'central' if VPC is peered to BCG network, otherwise 'island'."
  default     = "workspace"
}

variable "customer" {
  default     = "Sogeti-PostNL"
  description = "name of the product resource belongs to."
}
