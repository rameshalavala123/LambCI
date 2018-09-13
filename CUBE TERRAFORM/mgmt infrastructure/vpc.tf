module "main" {
  source              = "../modules/terraform-vpc-island"
  environment         = "${var.env}"
  aws_region          = "${var.aws_region}"
  availability_zones  = "${var.availability_zones}"
  vpc_cidr            = "${var.vpc_cidr}"
  public_subnet_cidr  = "${var.public_subnet_cidr}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
  product             = "${var.product}"
  cost_center         = "${var.cost_center}"
  owner               = "${var.owner}"
}
