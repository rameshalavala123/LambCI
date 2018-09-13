module "instance" {
  source             = "../modules/terraform-ec2-instance"
  vpc_id             = "${module.main.vpc_id}"
  subnet_type        = "public"
  instance_type      = "${var.bastion["instance_type"]}"
  availability_zones = "${var.availibility_zone_ec2}"

  #security_group_id = "${module.securitygroup.security_group_id}"

  security_group_ids = ["${module.securitygroup.sg_id}"]

  #security_group_ids  = "${element(module.securitygroup.security_group_ids, 1)}"
  #security_group_ids = ["${module.securitygroup.this_security_group_id}"]

  number_of_instances = "${var.create_bastion==true ? 1 : 0}"
  product             = "${var.product}"
  environment         = "${var.env}"
  key_name            = "${var.key_pair_name}"
  role                = "${var.role}"
  cost_center         = "${var.cost_center}"
  owner               = "${var.owner}"
}
