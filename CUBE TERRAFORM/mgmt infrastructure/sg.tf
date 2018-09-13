module "securitygroup" {
  source      = "../modules/terraform-security-group"
  environment = "${var.env}"
  aws_region  = "${var.aws_region}"
  vpc_id      = "${module.main.vpc_id}"
  product     = "${var.product}"
  cost_center = "${var.cost_center}"
  owner       = "${var.owner}"
}
