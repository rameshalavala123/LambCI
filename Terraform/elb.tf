resource "aws_lb" "elb" {
  #name               = "test-elb-tf"
  name = "Adfs"
  internal           = true
  load_balancer_type = "${var.load_balancer_type}"
  subnets=["subnet-0595312b","subnet-b4d6b8fe"]
  #availability_zones= ["us-east-1d"]
  enable_deletion_protection = "${var.enable_deletion_protection}"
  enable_cross_zone_load_balancing = "${var.enable_cross_zone_load_balancing}"
 
tags {
    Environment = "Test"
  }
}
resource "aws_lb_listener" "testexternal" {
  load_balancer_arn = "${aws_lb.elb.arn}"
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
  vpc_id   = "vpc-7086640a"

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    interval            = "${var.interval}"
    port                = "${var.port}"
    protocol            = "${var.protocol}"
  }
}
resource "aws_lb_target_group_attachment" "testexternal" {
  target_group_arn = "${aws_lb_target_group.testexternal.arn}"
  target_id        = "${aws_instance.lb.id}"
  port             = "${var.port}"
  count = 2
}
/*resource "aws_elb_attachment" "ec2" {
  elb      = "${aws_lb.elb.id}"
  instance = "${aws_instance.lb.id}"
  }*/
resource "aws_instance" "lb" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
    tags {
    Name = "ELB"
  }
  
}
/*resource "aws_security_group" "ELBSecurityGroup" {
  name = "ELBSecurityGroup1"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}*/
