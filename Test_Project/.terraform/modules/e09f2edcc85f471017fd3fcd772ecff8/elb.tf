resource "aws_lb" "test-elb-tf" {
  name               ="${var.tagname_elb}"
  internal           = "${var.internal}"
  load_balancer_type = "${var.balancer_type}"
  #subnets=["subnet-5670490c"]
  subnets=["${var.subnet_id}"]
  enable_deletion_protection = "${var.protection}"
  enable_cross_zone_load_balancing = "${var.cross_zone}"
tags {
    Name="${var.tagname_elb}"
    }
}
resource "aws_lb_listener" "testexternal" {
  load_balancer_arn = "${aws_lb.test-elb-tf.arn}"
  protocol          = "${var.protocol}"
  port              = "${var.port}"


  default_action {
    target_group_arn = "${aws_lb_target_group.testexternal.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group" "testexternal" {
  name     = "testexternal"
  protocol = "${var.protocol}"
  port     = "${var.port}"
  #vpc_id   = "vpc-70967a08"
  vpc_id="${var.vpc_id}"
  
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    interval            = 10
    port                = "${var.port}"
    protocol            = "${var.protocol}"
  }
}
resource "aws_lb_target_group_attachment" "testexternal" {
  target_group_arn = "${aws_lb_target_group.testexternal.arn}"
  #target_id        = "${aws_instance.test-elb.id}"
  target_id="${var.target_id}"
  port             = "${var.port}"
  
}
/*resource "aws_instance" "test-elb" {
  ami           = "ami-04681a1dbd79675a5"
  instance_type = "t2.micro"

  tags {
    Name = "TestELB"
  }
}*/
output "elb_id"{
    value="aws_lb.test-elb-tf.id"
}
