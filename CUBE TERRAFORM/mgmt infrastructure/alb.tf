module "my-alb" {
  source = "../modules/terraform-elb"

  #security_group_ids = ["${module.securitygroup.security_group_id}"]
  vpc_id = "${module.main.vpc_id}"

  subnet_type = "private"
  product     = "${var.product}"
  environment = "${var.env}"
  cost_center = "${var.cost_center}"

  #instances       = ["${element(module.instance.instance_ids, 0)}"]
  #instance        = "${module.instance.instance_ids}"
  role = "test"

  expiration_date = "20/06/18"
}
