module "my-volume" {
  source      = "../modules/terraform-ebs-volume"
  az          = "${var.availability_zones_ebs}"
  product     = "${var.product}"
  environment = "${var.env}"
  cost_center = "${var.cost_center}"
  owner       = "${var.owner}"
  role        = "${var.role}"
  size        = 20
  zone        = "private"
}

resource "aws_volume_attachment" "attachment" {
  device_name = "/dev/sdj"
  volume_id   = "${module.my-volume.ebs_volume_id}"

  instance_id = "${element(module.instance.instance_ids, 1)}"
}
