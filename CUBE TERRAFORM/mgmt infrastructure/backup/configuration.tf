/*provider "aws" {
  region = "${var.aws_region}"

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/AllowTerraform"
  }
}*/

provider "aws" {
  access_key = "AKIAJYFYK255IMCER4LQ"
  secret_key = "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"
  region     = "us-east-1"
}

/*
terraform {
  backend "s3" {
    bucket   = "postnl-t-eu-west-1-cpp-s3s"
    key      = "init-terraform.tf"
    region   = "eu-west-1"
    role_arn = "arn:aws:iam::434457745749:role/EC2AccessAllow"
  }
}*/

