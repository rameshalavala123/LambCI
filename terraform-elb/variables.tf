variable "security_group_ids" {
  default = []
}

variable "vpc_id" {
  default     = ""
  description = "The VPC subnet the instance(s) will go in"
}

variable "subnet_type" {
  default     = "private"
  description = "Subnet type. Either private or public."
}

variable "ZONE" {
  default     = "M"
  description = "ZONE it belongs to as Management/Workspace.."
}

variable "cost_center" {
  default     = "POSTNL"
  description = "Cost Center"
}

variable "extra_tags" {
  type        = "map"
  description = "Any number of custom tags"
  default     = {}
}

variable "owner" {
  default     = "abcd@sogeti.com"
  description = "This should be an email of a person or a group that is responsible for the resource."
}

variable "cluster" {
  default = ""
}

variable "sub_environment" {
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

variable "customer" {
  default     = "Sogeti-PostNL"
  description = "name of the product resource belongs to."
}

variable "availability_zones" {
  default     = ["eu-west-1a", "eu-west-1b"]
  description = "The availability zones the we should create subnets in, launch instances in, and configure for ELB and ASG"
}

variable "role" {
  type = "string"
}

variable "logs_enabled" {
  default = true
}

variable "type" {
  default = "application"
}

variable "expiration_date" {
  default = "20/06/18"
  type    = "string"
}

variable "idle_timeout" {
  default = 60
}

variable "internal" {
  default = false
}

variable "enable_deletion_protection" {
  default = false
}
