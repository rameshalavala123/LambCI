output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "public-subnet_id" {
    value = "${aws_subnet.public-subnet.id}"
}
output "sg_id"{
    value="aws_security_group.sg.id"
}