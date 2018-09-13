resource "aws_vpc" "main_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}-vpc"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
    Type        = "${var.type}"
  }
}

###################
# Public subnets  #
###################

resource "aws_internet_gateway" "mod" {
  vpc_id = "${aws_vpc.main_vpc.id}"

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}-igw"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.main_vpc.id}"
  cidr_block        = "${element(var.public_subnet_cidr, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  count             = "${length(var.public_subnet_cidr)}"

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}_${element(var.availability_zones, count.index)}_public-subnet"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
    Zone        = "public"
  }

  map_public_ip_on_launch = true
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  count  = "${length(var.public_subnet_cidr)}"

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}_${element(var.availability_zones, count.index)}_public-route"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
    Zone        = "public"
  }
}

resource "aws_route" "public_internet_gateway" {
  count                  = "${length(var.public_subnet_cidr)}"
  route_table_id         = "${element(aws_route_table.public.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.mod.id}"
}

resource "aws_route_table_association" "public" {
  count          = "${length(var.public_subnet_cidr)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}

###################
# Private subnets #
###################

resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.main_vpc.id}"
  cidr_block        = "${element(var.private_subnet_cidr, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  count             = "${length(var.private_subnet_cidr)}"

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}_${element(var.availability_zones, count.index)}_private-subnet"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
    Zone        = "private"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  count  = "${length(var.private_subnet_cidr)}"

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}_${element(var.availability_zones, count.index)}_private-route"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
    Zone        = "private"
  }
}

resource "aws_route_table_association" "private" {
  count          = "${length(var.private_subnet_cidr)}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_eip" "nat_eip" {
  vpc = true

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}-nat-eip"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${element(aws_subnet.public.*.id, 0)}"

  tags {
    Name        = "${var.customer}_${var.env}_${var.ZONE}-ngw"
    Product     = "${var.product}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}

// Route traffic from private subnet out to the internet via the NAT Gateway
resource "aws_route" "route_private_nat" {
  count                  = "${length(var.private_subnet_cidr)}"
  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.gw.id}"
}
