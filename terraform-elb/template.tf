data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

resource "null_resource" "force_dependencies" {
  triggers {
    cluster_instance_ids = "${join(",", values(var.extra_tags))}"
  }
}
/*
data "aws_subnet_ids" "subnets" {
  vpc_id = "${var.vpc_id}"

  tags {
    Zone = "${var.subnet_type}"
  }

  depends_on = ["null_resource.force_dependencies"]
}
*/
resource "aws_lb" "lb" {
  name               = "${var.customer}-${var.env}-${var.ZONE}-${element(var.availability_zones, count.index)}-alb"
  internal           = "${var.internal}"
  security_groups    = ["${var.security_group_ids}"]
  subnets            = ["${var.subnet}"]
  load_balancer_type = "${var.type}"

  enable_deletion_protection = "${var.enable_deletion_protection}"
  idle_timeout               = "${var.idle_timeout}"

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}_${element(var.availability_zones, count.index)}-alb"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}
