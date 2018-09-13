variable "aws_account_id" {
  default     = "434457745749"
  description = "The AWS Account ID that we should connect to.  This validates that we are using the right access key."
}

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS Region to build the VPC in.  Only one region is supported right now."
}
