data "aws_ami" "base_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${lookup(var.ami_pattern, var.ami)}"]
  }

  owners = ["137112412989", "309956199498", "801119661308", "099720109477"]
}

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

// EC2 Instance Resource for Module

resource "aws_instance" "ec2_instance" {
  #ami = "ami-ca0135b3"

  ami           = "${data.aws_ami.base_ami.id}"
  subnet_id     = "${element(data.aws_subnet_ids.subnets.ids, "${"${count.index % 2}" == "0" ? 0 : 1}")}"
  instance_type = "${var.instance_type}"

  #security_group_ids = "${var.security_group_ids}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  key_name               = "${var.key_name}"
  ebs_optimized          = "${var.ebs_optimized}"

  root_block_device = {
    volume_type           = "${lookup(var.root_block_device, "volume_type")}"
    volume_size           = "${lookup(var.root_block_device, "volume_size")}"
    delete_on_termination = "${lookup(var.root_block_device, "delete_on_termination")}"
  }

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}_${element(var.availability_zones, count.index)}-bastion-f-ec2"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }

  count = "${var.number_of_instances}"

  lifecycle {
    ignore_changes = ["ami", "user_data", "subnet_id", "key_name", "ebs_optimized", "private_ip"]
  }
}

resource "aws_eip" "eip" {
  instance = "${element(aws_instance.ec2_instance.*.id, count.index)}"
  vpc      = true
  count    = "${var.subnet_type == "public" ? var.number_of_instances : 0}"

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}-bastion-eip"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}
