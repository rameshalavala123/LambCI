data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

resource "null_resource" "force_dependencies" {
  triggers {
    cluster_instance_ids = "${join(",", values(var.extra_tags))}"
  }
}

data "aws_subnet_ids" "subnets" {
  vpc_id = "${var.vpc_id}"

  tags {
    Zone = "${var.subnet_type}"
  }

  depends_on = ["null_resource.force_dependencies"]
}

resource "aws_lb" "lb" {
  # name               = "${var.product}${var.cluster == "" ? "" : "-${var.cluster}"}-${replace(var.role, "_", "-")}-${var.environment}${var.sub_environment == "" ? "" : "-${var.sub_environment}"}"
  name               = "${var.customer}-${var.env}-${var.ZONE}-${element(var.availability_zones, count.index)}-alb"
  internal           = "${var.internal}"
  security_groups    = ["${var.security_group_ids}"]
  subnets            = ["${data.aws_subnet_ids.subnets.ids}"]
  load_balancer_type = "${var.type}"

  enable_deletion_protection = "${var.enable_deletion_protection}"
  idle_timeout               = "${var.idle_timeout}"

  /*
  access_logs {
    #bucket  = "devops-${var.product}-logs"
    bucket  = "alb-logs-manuj"
    prefix  = "${var.role}/${var.environment}/lb"
    enabled = "${var.logs_enabled}"
  }*/
}
