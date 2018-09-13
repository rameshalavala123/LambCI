resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = "${var.hostname}"

  tags {
    Name = "${var.tagname_vpc}"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.main.id}"
  #cidr_block = "${var.public_subnet_cidr}"
  #cidr_block="${element(var.public_subnet_cidr,count.index)}"
  cidr_block="${element(var.public_subnet_cidr,0)}"
  availability_zone = "${element(var.availability_zones_public, 0)}"
  map_public_ip_on_launch="${var.map_public_ip}"

  tags {
    Name = "${var.tagname_publicsub}"
  }
}
resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.main.id}"
  #cidr_block = "${var.private_subnet_cidr}"
  #cidr_block="${element(var.public_subnet_cidr,count.index)}"
  cidr_block="${element(var.public_subnet_cidr,1)}"
  availability_zone = "${element(var.availability_zones_public, 1)}"
  #availability_zone = "${var.availability_zones_private}"

  tags {
    Name = "${var.tagname_privatesub}"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.tagname_gw}"
  }
}
resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "${var.tagname_rt}"
  }
}
resource "aws_route_table_association" "public-rt" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.rt.id}"
}