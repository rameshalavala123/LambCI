variable "type" {
  default     = "standard"
  description = "The type of EBS volume. Can be 'standard', 'gp2', 'io1', 'sc1' or 'st1' (Default: 'standard')."
}

variable "size" {
  default = 40
}

variable "az" {
  default = ""
}

variable "product" {
  type = "string"
}

variable "environment" {
  type = "string"
}

variable "sub_environment" {
  default = ""
}

variable "cluster" {
  default = ""
}

variable "cost_center" {
  type = "string"
}

variable "owner" {
  type = "string"
}

variable "role" {
  type = "string"
}

variable "zone" {
  type = "string"
}
