// Variables that can be overriden on the command line, or in .tfvars files.

variable "aws_account_id" {
  default     = "434457745749"
  description = "The AWS Account ID that we should connect to.  This validates that we are using the right access key."
}

variable "aws_region" {
  default     = "eu-west-1"
  description = "The AWS Region to build the VPC in.  Only one region is supported right now."
}

variable "availability_zones" {
  default     = ["eu-west-1a", "eu-west-1b"]
  description = "The availability zones the we should create subnets in, launch instances in, and configure for ELB and ASG"
}

variable "availability_zones_ebs" {
  default     = "eu-west-1a"
  description = "The availability zones the we should create subnets in, launch instances in, and configure for ELB and ASG"
}

variable "availibility_zone_ec2" {
  default     = ["eu-west-1a"]
  description = "The availability zones the we should create subnets in, launch instances in, and configure for ELB and ASG"
}

variable "vpc_cidr" {
  default     = "10.10.0.0/24"
  description = "The range of IP addresses that we use in this VPC"
}

variable "public_subnet_cidr" {
  default     = ["10.10.0.0/26", "10.10.0.64/26"]
  description = "CIDR blocks for public subnets. Comma separated list. Number of entries must match 'availability_zones'."
}

variable "private_subnet_cidr" {
  default     = ["10.10.0.128/26", "10.10.0.192/26"]
  description = "CIDR blocks for private subnets. Comma separated list. Number of entries must match 'availability_zones'."
}

variable "product" {
  description = "name of the product resource belongs to."
  default     = "Test-pnl-aws"
}

variable "env" {
  default     = "test"
  description = "Environment resource belongs to. Value of this tag is used inside Chef configuration to fetch required config"
}

variable "cost_center" {
  default     = "POSTNL"
  description = "Cost Center"
}

variable "owner" {
  default     = "abcd@sogeti.com"
  description = "This should be an email of a person or a group that is responsible for the resource."
}

variable "key_pair_name" {
  default = "IrelandKey"
}

variable "role" {
  default = "read"
}

variable "ami" {
  type        = "map"
  description = "Linux AMI for services"

  default = {
    eu-central-1 = "ami-9673bcf9"
    us-east-1    = "ami-2423d532"
  }
}

variable "create_bastion" {
  default = "true"
}

variable "bastion" {
  type = "map"

  default = {
    instance_type = "t2.micro"
  }
}

/*
variable "access_key" {
  default = "AKIAJYFYK255IMCER4LQ"
}

variable "secret_key" {
  default = "r2UXVYUYUpVwU8E3pBItNNshorU9RnIa6qBucY9X"
}
*/

