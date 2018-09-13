resource "aws_security_group" "private_sg" {
  count = "${length(var.private_subnet_cidr)}"

  vpc_id = "${var.vpc_id}"

  tags = {
    Name        = "${var.customer}_${var.env}_${var.ZONE}_${element(var.availability_zones, count.index)}_cpp_private-sg"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}

resource "aws_security_group" "public_sg" {
  count = "${length(var.public_subnet_cidr)}"

  vpc_id = "${var.vpc_id}"

  tags = {
    Name        = "${var.customer}_${var.env}_${var.ZONE}_${element(var.availability_zones, count.index)}_cpp_public-sg"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}

output "sg_id" {
  value = "${aws_security_group.public_sg.*.id}"
}
