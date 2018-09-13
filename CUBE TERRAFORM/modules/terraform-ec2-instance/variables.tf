variable "ami" {
  default = "linux"
}

variable "ami_pattern" {
  default = {
    "awsami"  = "Amazon Linux AMI*"
    "linux"   = "RHEL-7.5_HVM_GA-*"
    "windows" = "Windows_Server-2016-English-Full-Base*"
    "ubuntu"  = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server*"
  }
}

variable "key_name" {
  default = "IrelandKey"
}

variable "ebs_optimized" {
  default = "false"
}

variable "security_group_ids" {
  default = []
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_id" {
  default     = ""
  description = "The VPC subnet the instance(s) will go in"
}

variable "subnet_type" {
  default     = "public"
  description = "Subnet type. Either private or public."
}

variable "subnet_index" {
  description = "Subnet index - in case multiple subnets found and you want to use concrete one."
  default     = 1
}

variable "number_of_instances" {
  description = "number of instances to make"
  default     = 1
}

variable "iam_role" {
  default = "base"
}

variable "root_block_device" {
  default = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }
}

variable "extra_tags" {
  type        = "map"
  description = "Any number of custom tags"
  default     = {}
}

variable "cluster" {
  default = ""
}

variable "sub_environment" {
  default = ""
}

variable "owner" {
  type = "string"
}

variable "role" {
  type = "string"
}

variable "user_data" {
  default = ""
  type    = "string"
}

variable "expiration_date" {
  default = "20/06/18"
  type    = "string"
}

variable "private_ip" {
  default = ""
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
  default     = "M"
  description = "ZONE it belongs to as Management/Workspace.."
}

variable "cost_center" {
  default     = "GENERIC_UNSPECIFIED"
  description = "Cost Center"
}

variable "customer" {
  default     = "Sogeti-PostNL"
  description = "name of the product resource belongs to."
}

variable "availability_zones" {
  default     = ["eu-west-1a", "eu-west-1b"]
  description = "The availability zones the we should create subnets in, launch instances in, and configure for ELB and ASG"
}
