/*data "aws_kms_alias" "fse-ebs" {
  name = "alias/fse/ebs"
}
*/
resource "aws_ebs_volume" "volume" {
  availability_zone = "${var.az}"
  size              = "${var.size}"
  type              = "${var.type}"
  encrypted         = false

  /*kms_key_id        = "${replace(data.aws_kms_alias.fse-ebs.arn, "alias/fse/ebs", "key/${data.aws_kms_alias.fse-ebs.target_key_id}")}"

  tags {
    "Name"           = "${var.product}${var.cluster == "" ? "" : "-${var.cluster}"}-${replace(var.role, "_", "-")}-${var.environment}${var.sub_environment == "" ? "" : "-${var.sub_environment}"}"
    "Environment"    = "${var.environment}"
    "SubEnvironment" = "${var.sub_environment}"
    "CostCenter"     = "${var.cost_center}"
    "Owner"          = "${var.owner}"
    "Product"        = "${var.product}"
    "Cluster"        = "${var.cluster}"
    "Role"           = "${var.role}"
    "Zone"           = "${var.zone}"
  }*/
}
