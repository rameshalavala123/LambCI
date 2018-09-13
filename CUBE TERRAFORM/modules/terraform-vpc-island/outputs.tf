output "vpc_id" {
  value = "${aws_vpc.main_vpc.id}"
}

output "public_subnet_ids" {
  value = ["${aws_subnet.public.*.id}"]
}

output "private_subnet_ids" {
  value = ["${aws_subnet.private.*.id}"]
}

output "public_route_table_ids" {
  value = ["${aws_route_table.public.*.id}"]
}

output "private_route_table_ids" {
  value = ["${aws_route_table.private.*.id}"]
}

output "internet_gateway_id" {
  value = "${aws_internet_gateway.mod.id}"
}

output "nat_gateway_id" {
  value = "${aws_nat_gateway.gw.id}"
}

output "nat_eip" {
  value = "${aws_eip.nat_eip.id}"
}
